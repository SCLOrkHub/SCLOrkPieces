/*

This file:

-- creates simple SynthDef with possible effects to play back samples

*/

// A simple SynthDef to play back samples

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