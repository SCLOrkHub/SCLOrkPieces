/*

this file creates the ~dursFrom function that extracts duration from an Array

also creates custom event type \dirt which picks mono or stereo synthdef according to given sample

*/

// Some examples


// Custom function - takes in a list and optional cycle duration in beats.
// Returns a list of durations based on the composition of the array
~dursFrom = {|array, dur=1|
    var size = array.size;
    var subdiv = dur / size;
    var result = array.collect({ |item|
        if(item.isArray, {
            ~dursFrom.value(item, subdiv)
        }, {
            subdiv
        });
    });
    result.flat;
};


Event.addEventType(\dirt, {
	~instrument = if(d.at(~sampleName).numChannels == 1, { \pb1 }, { \pb2 });
	~buf = d.at(~sampleName);
	~testFunc = { |number| number * 2 };
	~type = \note;
	currentEnvironment.play;
});


// List all existing Ndefs, with info whether it's playing and monitoring
~listAll = {
	var isPlaying, isMonitoring, string, return;
	return = List.new;
	Ndef.dictFor(s).do({ | ndef |
		var key = ndef.key;
		isPlaying = if(Ndef(key).isPlaying, { 1 }, { 0 });
		isMonitoring = if(Ndef(key).isMonitoring, { 1 }, { 0 });
		string = "m % p % Ndef(%)";
		if( (isPlaying==1) && (isMonitoring==1),
			{ string = "***" ++ string };
		);
		return.add(string.format(isMonitoring, isPlaying, ("\\" ++ key.asString)));
	});
	return.sort.do({ |s| s.postln });
	"m=monitoring, p=playing";
};

// Free all Ndefs except the ones in the list provided as argument
~freeAll = { | fadeTime = 5, leaveAlone |
	var exceptions = if( leaveAlone.isArray.not, { [ leaveAlone ] }, { leaveAlone });

	// never free metronome Ndefs
	exceptions = exceptions.add([\t, \tempo]).flat;

	Ndef.dictFor(s).do({ | ndef |
		var key = ndef.key;
		if( (exceptions.includes(key).not) && (ndef.isPlaying), {
			("Freeing Ndef(\\" ++ key.asString ++ ")...").postln;
			Ndef(key.asSymbol).free(fadeTime);
		}, {
			// ("Ndef(\\" ++ key.asString ++ ") left untouched").postln;
		})
	});
	"freeing active Ndefs over % seconds... \n".postf(fadeTime);
};


~sendScoreMsg = { | string |
	try { ~myClient.sendMessage(
		SCLOrkChatMessage.new(
			senderId: 0,
			recipientIds: [0],
			type: \plain,
			contents: string,
		)
	);
	}
};

~openVideo = { arg all = 0; // if 0, only obs player can run this function
	if( (~myName == "obs") || (all == 1), {
		{
			try { ~xjadeo.sendMsg('/jadeo/quit') };
			0.2.wait;
			"xjadeo -O 7890".unixCmd;
			1.wait;
			~xjadeo = NetAddr("localhost", 7890);
			~xjadeo.sendMsg('/jadeo/jack/connect');
			~xjadeo.sendMsg('/jadeo/load', PathName.new(q.hyperfolder).parentPath ++ "25x25.mp4");
			"echo locate 0 | jack_transport".unixCmd;
		}.fork;
	})
};

~rewindVideo = { arg all = 0;
	if( (~myName == "obs") || (all == 1), {
		"echo locate 0 | jack_transport".unixCmd;
		"echo stop | jack_transport".unixCmd;
	}, {
		"rewinding video...".postln;
	});
};

~closeSCLOrkWatch = {
		var sww = Window.find("SCLOrkWatch");
		if( sww.notNil, { sww.close } );
};

~startVideoAndSCLOrkWatch = { arg all = 0;

	// just in case
	~closeSCLOrkWatch.value;

	// start video if applicable
	if( (~myName == "obs") || (all == 1), {
		"echo locate 0 | jack_transport".unixCmd;
		"echo play | jack_transport".unixCmd;
	});

	// start SCLOrkWatch
	SCLOrkWatch.new([
		"0:20", {
			var msg = "**A1: chaos getting started...";
			~sendScoreMsg.value(msg);
			msg.postln;
		},
		// "0:25", { "fade in busy dots".postln },
		"0:38", {
			var msg = "busy dots are in. 25x25 grid coming soon at 0:56, prepare voices";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"0:56", {
			var msg = "**A2: 25x25 grid; speed increase coming at 1:26";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"1:26", {
			var msg = "**A3: suddenly busy, agitated, hectic";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"2:37", {
			var msg = "**A4: 1st separation [dizzy, unsettling] ... next at 3:09";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"3:09", {
			var msg = "**A5: 2nd separation [slower, orderly]... next at 3:54";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"3:54", { var msg = "**A6: 3rd separation [HECTIC]... next at 4:39";
			~sendScoreMsg.(msg);
			msg.postln; },
		"4:39", {
			var msg = "**A7: last separation (4 corners). Bouncing squares coming at 5:53";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		// "5:44", { "negative image inversion".postln },
		"5:53", {
			var msg = "**B1: Bouncing squares now. BLM coming at 6:32";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"6:32", {
			var msg = "**B2: BLM flashes. Bouncing squares coming again at 7:01";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"7:01", {
			var msg = "**B3: Bouncing squares, second round. No Justice No Peace coming at 8:18";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"8:18", {
			var msg = "**B4: No Justice No Peace word dance - less than 20 seconds to blackout";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"8:37", {
			var msg = "**CODA: Blackout, breathing dots coming soon to end";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		// "8:44", { "breathing dots".postln },
		"9:01", {
			var msg = "don't run any more code; bruno to freeAll & fadeOut soon";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"9:13", {
			var msg = "end of piece; pausing video on white screen";
			~sendScoreMsg.(msg);
			msg.postln;
			~rewindVideo.(1); // hack, but gives me white screen I need to end
		},
		"9:15", { "end".postln }
	]);
};

currentEnvironment.pairsDo({ |k, v| [k, v].postln });

"Utility Functions loaded".postln;






