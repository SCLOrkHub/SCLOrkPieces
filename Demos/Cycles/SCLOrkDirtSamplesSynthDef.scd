/*

This file:

-- creates simple SynthDef with possible effects to play back samples

*/

// A simple SynthDef to play back samples


[1, 2].do({ |n|

	var name = (\pb ++ n).asSymbol;
	SynthDef(name, {
		arg out=0, amp=0.2, rate=1, buf, pan=0, loop=1;
		var snd, env;
		env = Env.linen(
			attackTime: 0,
			sustainTime: BufDur.kr(buf) / rate.abs - 0.01,
			releaseTime: 0.01
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


SynthDescLib.global.at(\pb1).postln;
SynthDescLib.global.at(\pb2).postln;
[];



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



SynthDef(\superSaw, {
	arg
	//Standard Values
	out = 0, pan = 0, gate = 1, amp = 0.5, freq = 40,
	att = 0.1, dec = 0.2, sus = 0.9, rel = 5, crv = 0,
	// Detune Controls (spread goes from 0 to 1)
	detuneRatio = 1.025, numberOscs = 100, spread = 1, detuneFade = 0.25,
	// Filter Controls (preamp > 0)
	filterLo = 80, filterHi = 8000, rq = 0.8, preamp = 2,
	fAtt = 3, fDec = 3, fSus = 0.8, fRel = 5;

	var detuneHz, stepSize, faArray, freqArray, ampArray, phaseArray, env, fEnv, snd;

	// Scale detuneRatio and numberOscs
	detuneHz = (detuneRatio - 1) * freq;
	stepSize = (2 * detuneHz)/(numberOscs - 1);

	// An Array used for freqArray and ampArray
	faArray = Array.fill2D(100, 2, {
		arg i, j;
		if (j == 1)
		{ (numberOscs - i).tanh.clip(0, 1).sign }
		{ ((stepSize * i) + (freq - detuneHz)).clip(20, 20000) }
	});
	faArray = faArray.scramble.flop;

	// Generate the Frequencies of all the Saws
	freqArray = faArray[0];

	// Generate the Amplitudes of all the Saws
	ampArray = abs(freq - freqArray);
	ampArray = (detuneHz - ampArray)/detuneHz;
	ampArray = ampArray.pow(detuneFade) * 0.1;
	ampArray = ampArray * faArray[1];

	// Generate the Phases of all the Saws
	phaseArray = {TRand.ar(
		lo: 0.000,
		hi: 2.000,
		trig: Impulse.ar(0))}.dup(100);

	// Envelopes for Volume and LPF
	env = Env.adsr(
		attackTime: att,
		decayTime: dec,
		sustainLevel: sus,
		releaseTime: rel,
		curve: crv).ar(doneAction: 2, gate: gate);
	fEnv = Env.adsr(
		attackTime: fAtt,
		decayTime: fDec,
		sustainLevel: fSus,
		releaseTime: fRel,
		curve: crv).ar(gate: gate);

	// Make the Saws
	snd = LFSaw.ar(
		freq: freqArray,
		iphase: phaseArray,
		mul: ampArray);
	snd = HPF.ar(
		in: snd,
		freq: freqArray);

	//Mix the Saws down to Stereo
	snd = Splay.ar(inArray: snd, spread: spread);
	snd = Normalizer.ar(
		in: snd,
		level: 1,
		dur: 0.02);

	// Filter the Saws
	snd = RLPF.ar(
		in: snd,
		freq: LinExp.ar(
			in: fEnv,
			srclo: 0, srchi: 1,
			dstlo: filterLo, dsthi: filterHi),
		rq: rq,
		mul: (preamp/2).clip(0.0001, inf));
	snd = snd.softclip;
	snd = snd/((preamp/2).clip(0.0001, inf).softclip);

	// Output Stuff
	snd = snd * amp * env;
	snd = Limiter.ar(snd);
	snd = Balance2.ar(
		left: snd[0],
		right: snd[1],
		pos: pan);

	Out.ar(out, snd);
},
metadata: (
	credit: "Josh Mitchell",
	category: \pads,
	tags: [\pitched]
	)
).add;



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