/*

This file:

-- creates simple SynthDef with possible effects to play back samples

*/

// A simple SynthDef to play back samples


[1, 2].do({ |n|

	var name = (\pb ++ n).asSymbol;
	SynthDef(name, {
		arg out=0, amp=0.2, rate=1, buf, pan=0;
		var snd;
		snd = PlayBuf.ar(
			numChannels: n,
			bufnum: buf,
			rate: BufRateScale.kr(buf) * rate,
			doneAction: 2
		);
		if(n==1, {
			// if a mono sample
			snd = Pan2.ar(snd, pan);
		}, {
			// else, if a stereo sample
			snd = Balance2.ar(snd[0], snd[1], pan);
		});
		Out.ar(out, snd*amp);
	}).add;
});


SynthDescLib.global.at(\pb1).postln;
SynthDescLib.global.at(\pb2).postln;
[];



SynthDef("gr", {arg out = 0, buffer, rate = 1, startPos = 0, gate = 1, att = 0.01, rel = 0.1, amp = 1, pan = 0;
	var env, snd;
	env = Env.asr(att, amp, rel).kr(gate: gate);
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  buffer,
		rate: rate,
		startPos: startPos * BufSamples.kr(buffer)
	);
	snd = snd * env;
	Out.ar(out, Pan2.ar(snd, pan));
	DetectSilence.ar(snd, doneAction: 2);
}).add;

SynthDescLib.global.at(\gr).postln;



/*


SynthDef(\rhpf, {
	arg out = 0, inBus, rhpff = 500, rhpfr = 0.5;
	var snd;
	snd = RHPF.ar(
		in: In.ar(inBus),
		freq: rhpff.abs.clip(20, SampleRate.ir/2),
		rq: rhpfr.linexp(0, 1, 0.001, 1)
	);
	Out.ar(out, snd);
}).add;


SynthDef(\pb, { arg amp = 0.2, rate = 1, buf, mix=0.0, room=0.5, damp=0.5, hpff = 20, hpfr=0.5, pan=0;
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buf,
		rate: BufRateScale.kr(buf) * rate,
		doneAction: 2
	);
/*	snd = FreeVerb.ar(
		in: snd,
		mix: mix,
		room: room,
		damp: damp
	);
	DetectSilence.ar(snd, doneAction: 2);*/
	snd = RHPF.ar(
		in: snd,
		freq: hpff.abs.clip(20, SampleRate.ir/2),
		rq: hpfr.linexp(0, 1, 0.001, 1)
	);
	snd = Pan2.ar(Mix(snd), pan);
	Out.ar(0, snd*amp);
}).add;

*/