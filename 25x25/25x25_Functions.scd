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
~freeAll = { | fadeTime = 5, leaveAlone = \t |
	var exceptions = if( leaveAlone.isArray.not, { [ leaveAlone ] }, { leaveAlone });

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

~openVideo = { arg all = 0; // if 0, only obs player actually runs
	if( (~myName == "obs") || (all == 1), {
		{
			"xjadeo -O 7890".unixCmd;
			1.wait;
			~xjadeo = NetAddr("localhost", 7890);
			~xjadeo.sendMsg('/jadeo/jack/connect');
			~xjadeo.sendMsg('/jadeo/load', "25x25.mp4".resolveRelative);
			"echo locate 0 | jack_transport".unixCmd;
		}.fork;
	})
};

// only obs player can control video functions (avoid mess in public mode)
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
			var msg = "chaos getting started...";
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
			var msg = "25x25 grid now; sudden shift coming at 1:26";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"1:26", {
			var msg = "suddenly busy, agitated, hectic";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"2:37", {
			var msg = "1st separation [dizzy, unsettling] ... next at 3:09";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"3:09", {
			var msg = "2nd separation [slower, orderly]... next at 3:54";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"3:54", { var msg = "3rd separation [HECTIC]... next at 4:39";
			~sendScoreMsg.(msg);
			msg.postln; },
		"4:39", {
			var msg = "4th last separation (4 corners). Bouncing squares coming at 5:53";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		// "5:44", { "negative image inversion".postln },
		"5:53", {
			var msg = "Bouncing squares now. BLM coming at 6:32";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"6:32", {
			var msg = "BLM now. Bouncing squares again at 7:01";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"7:01", {
			var msg = "Bouncing squares, second round. No Justice No Peace coming at 8:18";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"8:18", {
			var msg = "No Justice No Peace word dance - less than 20 seconds to blackout";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"8:37", {
			var msg = "Blackout coda, breathing dots coming soon to end";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		// "8:44", { "breathing dots".postln },
		"9:01", {
			var msg = "don't run any more code; bruno to clearAll & fadeOut soon";
			~sendScoreMsg.(msg);
			msg.postln;
		},
		"9:13", {
			var msg = "end of piece; pausing video on white screen";
			~sendScoreMsg.(msg);
			msg.postln;
			"echo stop | jack_transport".unixCmd;
		},
		"9:15", { "end".postln }
	]);
};

currentEnvironment.keys.postln;

"Utility Functions loaded".postln;






