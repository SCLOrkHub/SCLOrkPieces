/*
additional set up code for 25x25
(after loading basic all-in-one sclork setup)

This file runs automatically once player picks piece name from "Load New Piece" button (Butz)
*/

// We assume 'd' holds a dictionary of samples (ie, player has already loaded Dirt Samples)

if(d.notNil, {

	// ************************
	// ************************
	//
	// Additional samples
	//
	// ************************
	// ************************

	Ndef.clear;

	d.put(\trump, Buffer.read(s, "trump-coronavirus-mono.wav".resolveRelative));
	d.put(\biden, Buffer.read(s, "biden-i-would-veto-mono.wav".resolveRelative));
	d.put(\covid1, Buffer.read(s, "covid1.wav".resolveRelative));
	d.put(\covid2, Buffer.read(s, "covid2.wav".resolveRelative));
	d.put(\covid3, Buffer.read(s, "covid3.wav".resolveRelative));
	d.put(\progress, Buffer.read(s, "progress-mono.wav".resolveRelative));
	d.put(\kaba, Buffer.read(s, "kaba.wav".resolveRelative));

	// This Ndef just plays back the trump sample continuously;
	Ndef(\raw, { PlayBuf.ar(1, d.trump, loop: 1) });

	// This (re)creates a general purpose clock that Ndefs can use; also quants all proxies to 1 beat
	// 25x25 uses 150 BPM as default
	p = Ndef(\tempo).proxyspace.makeTempoClock(150/60).quant_(1.0);

	// Creates a convenience Ndef to act as metronome wherever an Impulse can be used
	Ndef(\t, { Impulse.ar(Ndef(\tempo)) }); // we'll use Ndef(\t) to get a trigger on the clock

	"".postln;
	"Trump buffer loaded and playing under Ndef(\\raw)".postln;
	"TempoBusClock started at 150 BPM".postln;
	"Ndef(\\t) is available as a 150 BPM 'trigger metronome'".postln;
	"Ndef setup OK".postln;

	// ************************
	// ************************
	//
	// Miscellaneous Functions
	//
	// ************************
	// ************************


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

	"25x25 Functions loaded".postln;

}, {
	// ELSE, (if d was nil)
	"***ERROR: Could not load 25x25.\nNo sample dictionary available.\nPlease load Dirt Samples first then try again.".postln;
});