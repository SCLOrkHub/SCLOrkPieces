/*
additional set up code for 20x20
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
	d.put(\covid4, Buffer.read(s, "covid4.wav".resolveRelative));
	d.put(\progress, Buffer.read(s, "progress-mono.wav".resolveRelative));
	d.put(\kaba, Buffer.read(s, "kaba.wav".resolveRelative));

	// This Ndef just plays back the trump sample continuously;
	Ndef(\raw, { PlayBuf.ar(1, d.trump, loop: 1) });

	// This (re)creates a general purpose clock that Ndefs can use; also quants all proxies to 1 beat
	// 25x25 uses 150 BPM as default
	p = Ndef(\tempo).proxyspace.makeTempoClock(150/60).quant_(1.0);

	// Creates a convenience Ndef to act as metronome wherever an Impulse can be used
	Ndef(\t, { Impulse.ar(Ndef(\tempo)) }); // we'll use Ndef(\t) to get a trigger on the clock


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
				~xjadeo.sendMsg('/jadeo/load', Quarks.folder +/+ "SCLOrkPieces/20x20/20x20.mp4");
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
			"0:06", {
				var msg = "20x20 starting. Section A1 coming up at 0:20";
				~sendScoreMsg.value(msg);
				msg.postln;
			},
			"0:20", {
				var msg = "**A1: chaos getting started...";
				~sendScoreMsg.value(msg);
				msg.postln;
			},
			// "0:25", { "fade in busy dots".postln },
			"0:44", {
				var msg = "dark, busy dots are in. Grid coming soon at 1:02, prepare voices";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"1:02", {
				var msg = "**A2: grid is in. Speed increase coming at 1:30";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"1:30", {
				var msg = "**A3: suddenly busy, agitated, hectic. 1st separation coming at 2:41";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"2:41", {
				var msg = "**A4: 1st separation [dizzy, unsettling] ... next at 3:14";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"3:14", {
				var msg = "**A5: 2nd separation [slower, orderly]... next at 3:56";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"3:56", { var msg = "**A6: 3rd separation [HECTIC]... next at 4:42";
				~sendScoreMsg.(msg);
				msg.postln; },
			"4:42", {
				var msg = "**A7: last separation (4 corners). BW inversion at 5:47";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"5:47", {
				var msg = "end of A section: negative image busy blinking. Bouncing squares at 5:57";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"5:57", {
				var msg = "**B1: Bouncing squares now. Over 2 minutes long. Bass only at first, others come in sparsely and building up. BLM coming at 8:28";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"8:28", {
				var msg = "**B2: BLM flashing. Full drum pattern. Speed up coming at 8:46";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"8:46", {
				var msg = "**Faster flashes leading up to NJNP at 9:01";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"9:01", {
				var msg = "**B3: No Justice No Peace. Blackout + outro coming at 10:52";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"10:52", {
				var msg = "**CODA: Blackout, breathing dots. End within the next 40 seconds";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"11:25", {
				var msg = "don't run any more code; bruno to freeAll & fadeOut soon";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"11:30", {
				var msg = "end of piece (white screen). Video runs for another 30 seconds, stop livestream before that.";
				~sendScoreMsg.(msg);
				msg.postln;
			},
			"12:00", { "end".postln }
		]);
	};



	// Open COPY of this user 20x20 starter code:
	Document.new(
		title: ~myName.asString ++ " 20x20 copy " ++ (Date.localtime.stamp[7..10]).asString,
		string: String.readNew(
			File.new(
				pathName: Quarks.quarkNameAsLocalPath("SCLOrkPieces")
				+/+
				"20x20"
				+/+ (~myName.asString) ++ ".scd",
				mode: "r"
		));
	).front;

	currentEnvironment.pairsDo({ |k, v| [k, v].postln });

	"".postln;
	"Trump buffer loaded and playing under Ndef(\\raw)".postln;
	"TempoBusClock started at 150 BPM".postln;
	"Ndef(\\t) is available as a 150 BPM 'trigger metronome'".postln;
	"Ndef setup OK".postln;
	"20x20 STARTER CODE FILE OPEN IN A NEW TAB".postln;

[1, 2].do({ |n|

	var name = (\pb ++ n).asSymbol;
	SynthDef(name, {
		arg out=0, amp=0.2, rate=1, buf, pan=0, loop=1, sus=10, rel=0.01;
		var snd, env, sustain;
		sustain = min(BufDur.kr(buf) / rate.abs - 0.01, sus);
		env = Env.linen(
				attackTime: 0,
				sustainTime: sustain,
			releaseTime: min(BufDur.kr(buf) / rate.abs - sustain, rel)
		).kr(doneAction: 2);
		snd = PlayBuf.ar(
			numChannels: n,
			bufnum: buf,
			rate: BufRateScale.kr(buf) * rate,
			loop: loop
		);
		if(n==1, {
			// if a mono sample
			snd = Pan2.ar(snd, pan);
		}, {
			// else, if a stereo sample
			snd = Balance2.ar(snd[0], snd[1], pan);
		});
		snd = snd * amp * env;
		Out.ar(out, snd);
	}).add;
});

// SynthDescLib.global.at(\pb1).postln;
// SynthDescLib.global.at(\pb2).postln;
// [];



SynthDef("gr", {arg out = 0, buffer, rate = 1, startPos = 0, gate = 1, att = 0.01, rel = 0.1, amp = 1, pan = 0;
	var env, snd;
	env = Env.asr(att, amp, rel).kr(gate: gate, doneAction: 2);
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  buffer,
		rate: rate,
		startPos: startPos * BufSamples.kr(buffer)
	);
	snd = snd * env;
	Out.ar(out, Pan2.ar(snd, pan));
}).add;

}, {
	// ELSE, (if d was nil)
	"***ERROR: Could not load 20x20.\nNo sample dictionary available.\nPlease load Dirt Samples first then try again.".postln;
});