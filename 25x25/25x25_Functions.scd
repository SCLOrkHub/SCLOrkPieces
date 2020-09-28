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
		// "0:20", { "blackout".postln },
		"0:25", { "fade in busy dots".postln },
		"0:38", { "busy dots IN".postln },
		"0:56", { "25x25".postln },
		"2:37", { "1st degree of separation".postln },
		"3:09", { "2nd degree of separation".postln },
		"3:54", { "3rd degree of separation".postln },
		"4:39", { "4th degree of separation (4 corners only)".postln },
		"5:44", { "negative image inversion".postln },
		"5:53", { "4 bouncing squares".postln },
		"6:32", { "BLM".postln },
		"7:01", { "back to 4 bouncing squares".postln },
		"8:18", { "No Justice No Peace".postln },
		"8:37", { "Blackout".postln },
		"8:44", { "breathing dots".postln },
		"9:01", { "third ans last, towards white screen".postln },
		"9:13", { "white screen".postln },
		"9:15", { "end".postln }
	]);
};

currentEnvironment.keys.postln;

"Utility Functions loaded".postln;






