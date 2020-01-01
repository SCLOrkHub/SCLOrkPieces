// SynthDefs only

// what needs to happen in this file:
// 1. load all synthdefs


// ====================================
// Mic input synth
// ====================================

SynthDef("MicBuffer", {arg out;
	var mic;
	mic = HPF.ar(in: SoundIn.ar([0, 1]), freq: 100);
	mic = Mix.ar(mic);
	Out.ar(out, mic);
}).add;

// ============
// final Mixer
// ============

SynthDef("Mixer", { arg directMicBus, directMicLevel = 1.0, fxBus, fxLevel = 1.0, out = 0, reverbAmount = 1.0, masterVolume = 1.0;

	var dry, wet, snd;

	dry = Mix.ar([
		In.ar(directMicBus) * directMicLevel,
		In.ar(fxBus) * fxLevel
	]);

	wet = dry;
	7.do({
		wet = AllpassN.ar(
			in: wet,
			maxdelaytime: 0.043,
			delaytime: [0.038.rand, 0.036.rand],
			decaytime: 3.5
		)
	});

	wet = Mix.ar(wet) * 0.5;
	snd = Mix.new([wet * reverbAmount, dry * (1.0 - reverbAmount)]);
	snd = HPF.ar(snd, 150);
	Out.ar(out, snd * masterVolume)
}).add;


// ====================================
// Reverb synth
// ====================================

/*
SynthDef("Reverb", {arg in, out;
	var snd = FreeVerb.ar(
		in: In.ar(in),
		mix: 0.33,
		room: 0.7,
		damp: 0.5
	);
	Out.ar(out, snd);
}).add;
*/

// ====================================
// Object1 = Pitch Shift With Env [Pitch Variation]
// ====================================

SynthDef("Object1", { arg in, out, gate = 1;
	var snd, env, env2;
	env = Env.asr(attackTime: 0.1, sustainLevel: 0.8, releaseTime: 1.3).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.05, 0.95],
		times: [0.2, 0.6],
		curve: 'exponential'
	).kr(timeScale: 10);
	snd = PitchShift.ar(
		in: In.ar(in),
		windowSize: 2.0,
		pitchRatio: 1.0,
		pitchDispersion: 0.3 + env2,
		timeDispersion: 1.7
	);
	snd = snd * env;
	Out.ar(out, snd);
}).add;


// ====================================
// Object2 = Pitch Shift With Env & Buffer [Looping Pitch Variation]
// ====================================

SynthDef("Object2", {arg in, out, buffer, gate = 1, recstop = 1;
	var snd, env, env2;
	RecordBuf.ar(
		inputArray: In.ar(in),
		bufnum: buffer,
		run: recstop
	);
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 1.3
	).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.3, 1.7],
		times: [0.4, 1.6],
		curve: 'exponential'
	).kr(timeScale: 10);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		loop: 1
	);
	snd = PitchShift.ar(
		in: snd,
		windowSize: 1.0,
		pitchRatio: 1.4,
		pitchDispersion: 0.3 + env2,
		timeDispersion: 0.5
	);
	Out.ar(out, snd * env);
}).add;

// ====================================
// Object3: like the above, but with a Rand inside PitchShift [Looping Pitch Variation 2]
// ====================================

SynthDef("Object3", {arg in, out, buffer, gate = 1, recstop = 1;
	var snd, env, env2;
	RecordBuf.ar(
		inputArray: In.ar(in),
		bufnum: buffer,
		run: recstop
	);
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 1.3
	).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.3, 1.7],
		times: [0.4, 1.6],
		curve: 'exponential'
	).kr(timeScale: Rand(4, 10)); // Bruno modified this (was 10)
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		loop: 1
	);
	snd = PitchShift.ar(
		in: snd,
		windowSize: 1.0,
		pitchRatio: 2.0 * env, // Bruno added * env here
		pitchDispersion: 0.3 + env2 + Rand(0.0, 2.0),
		timeDispersion: 0.5
	);
	Out.ar(out, snd * env);
}).add;

// ====================================
// Object4 = Large Grain Env [Grainy sound]
// ====================================

SynthDef("Object4", {arg in, out, gate = 1;
	var snd, env, env2;
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 1.3
	).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.05, 0.95],
		times: [0.0001, 0.1],
		curve: 'exponential'
	).kr(timeScale: 10);
	snd = PitchShift.ar(
		in: In.ar(in),
		windowSize: 0.2,
		pitchRatio: 1.0,
		pitchDispersion: 0.3,
		timeDispersion: 0.1 + env2
	);
	snd = PitchShift.ar(
		in: snd,
		windowSize: 0.1,
		pitchRatio: 2.0,
		pitchDispersion: 0.4,
		timeDispersion: 0.005
	);
	// a bit of AM instead of panning, just for effect
	snd = snd * LFPulse.ar([16, 14.5]).range(0.5, 1.0);
	snd = Mix.ar(snd);
	Out.ar(out, snd * env);
}).add;

// ====================================
// Object5 = Delay Evolving PitchShift [Mechanical Popcorn]
// ====================================

SynthDef("Object5", { arg in, out, buffer, gate = 1, recstop = 1;
	var snd1, snd2, env, playbuf,
	dtime1, dtime2, dtime3,
	mix, decay,
	toscil,toscil2,toscil3;
	RecordBuf.ar(
		inputArray: In.ar(in),
		bufnum: buffer,
		run: recstop
	);
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 1.3
	).kr(gate: gate, doneAction: 2);

	dtime1 = XLine.kr(0.58, 0.007, 6);
	dtime2 = XLine.kr(0.43, 0.005, 8);
	dtime3 = XLine.kr(1.00, 0.040, 5);

	toscil = Dust.kr(16, mul: 0.006);
	toscil2 = Dust.kr(9, mul: 0.006);
	toscil3 = Dust.kr(5, mul: 0.006);

	playbuf = PlayBuf.ar(1, buffer, loop: 1);

	snd1 = CombC.ar(
		in: playbuf,
		maxdelaytime: 1.0,
		delaytime: [dtime1 + toscil, dtime2 + toscil2],
		decaytime: 0.5,
		add: playbuf * 0.4
	);
	snd1 = PitchShift.ar(
		in: snd1,
		windowSize: 3.0,
		pitchRatio: 1.0,
		pitchDispersion: 0.3,
		timeDispersion: 1.0
	);
	snd2 = CombC.ar(
		in: playbuf,
		maxdelaytime: 1.0,
		delaytime: toscil3 + dtime3,
		decaytime: 0.5
	);
	snd2 = PitchShift.ar(
		in: snd2,
		windowSize: 3.0,
		pitchRatio: 1.0,
		pitchDispersion: 0.7,
		timeDispersion: 0.4
	);
	decay = XLine.kr(0.4, 0.002, 50);
	mix = Mix.ar([
		playbuf * decay,
		snd1 * 0.8,
		snd2 * 0.7
	]);
	mix = BPF.ar(
		in: mix,
		freq: LFNoise0.kr(1/2).range(200, 2000),
		rq: LFNoise2.kr(1).range(0.1, 1),
		add: mix * SinOsc.ar(1/6).range(0, 1)
	);
	mix = Limiter.ar(in: mix, level: 0.8, dur: 0.03);
	mix = Mix.ar(mix);
	Out.ar(out, mix * env);
}).add;

// ====================================
// Object 6 = Delay Evolving Pshift II [Mechanical Phraser]
// ====================================

SynthDef("Object6", { arg in, out, buffer, gate = 1, recstop = 1;
	var env, playbuf, delay1, dtime1, mix, pshift, pshift2, pvar, toscil;
	RecordBuf.ar(
		inputArray: In.ar(in),
		bufnum: buffer,
		run: recstop
	);
	playbuf = PlayBuf.ar(1, buffer, loop: 1);
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 3
	).kr(gate: gate, doneAction: 2);
	dtime1 = Env.new(
		levels: [2.0, 0.8, 0.1, 0.05, 0.013],
		times: [0.2, 0.3, 0.1, 0.4],
		curve: 'exponential'
	).kr(timeScale: 24);
	delay1 = CombC.ar(
		in: playbuf,
		maxdelaytime: 4.0,
		delaytime: dtime1,
		decaytime: 0.4
	);
	pvar = Env.new(
		levels: [0.01, 0.01, 3.0],
		times: [0.4, 0.6],
		curve: 'exponential'
	).kr(timeScale: 60);
	toscil = SinOsc.kr(freq: 0.2, mul: 0.007);
	pshift = CombC.ar(
		in: delay1,
		maxdelaytime: 4.2,
		delaytime: dtime1 + toscil * [2, 2.002],
		decaytime: 0.05
	);
	pshift2 = PitchShift.ar(
		in: pshift,
		windowSize: 2.15,
		pitchRatio: 1.0,
		pitchDispersion: pvar,
		timeDispersion: 2.12
	);
	mix = (playbuf*0.9) + (delay1*0.9) + (pshift*0.7);
	mix = (mix * XLine.kr(0.9, 0.07, 80)) + pshift2;
	mix = LPF.ar(mix, 20000);
	mix = BPF.ar(mix, 1800, 0.2, 1.8, mix);
	mix = Mix.ar(mix);
	mix = Limiter.ar(mix, 0.9, 0.03);
	Out.ar(out, mix * env);
}).add;

// ====================================
// Object7 = amp controlled noise [Drastic Pitch Mod]
// ====================================

SynthDef("Object7", {arg in, out, gate = 1;
	var modulator1, modulator2, snd, env;
	env = Env.asr(
		attackTime: 15,
		sustainLevel: 0.8,
		releaseTime: 1.3).kr(gate: gate, doneAction: 2);
	modulator1 = SinOsc.ar(freq: [0.2, 0.3], mul: [9, 10], add: 10);
	modulator2 = SinOsc.ar(freq: modulator1, phase: [0, 180], mul: [1.5, 1.4]);
	snd =  PitchShift.ar(
		in: In.ar(in),
		windowSize: [0.02, 0.043],
		pitchRatio: 1.6 + modulator2
	);
	snd = Mix.ar(snd);
	Out.ar(out, snd * env);
}).add;


// ====================================
// Object8 = Low Thump [For Long Tone]
// ====================================

SynthDef("Object8", {arg in, out, gate = 1;
	var snd, env;
	env = Env.asr(0.2, 0.8, 5).kr(gate: gate, doneAction: 2);
	snd = PitchShift.ar(
		in: HPF.ar(in: In.ar(in), freq: 100),
		windowSize: 0.5,
		pitchRatio: [0.25, 0.5, 1],
		pitchDispersion: [0.04, 0.06],
		timeDispersion: [0.18, 0.19, 0.5]
	);
	snd = LPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3).range(500, 2000)
	);
	snd = FreeVerb.ar(snd, 0.33, 0.9, 0.9);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1.0,
		delaytime: XLine.ar(Rand(0.1, 0.2), Rand(0.22, 0.4), 1),
		decaytime: [1, 2, 3]
	);
	snd = Mix.ar(snd);
	Out.ar(out, snd * env);
}).add;

// ====================================
// Object9 = Reverse (Good for speech) [Looping Reverse]
// ====================================

SynthDef("Object9",{arg in, out, buffer, gate = 1, recstop = 1;
	var snd, env, env2, playbuf;
	RecordBuf.ar(
		inputArray: In.ar(in),
		bufnum: buffer,
		run: recstop
	);
	playbuf = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate: -1,
		loop: 1
	);
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 1.3
	).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.3, 0.7],
		times: [0.001, 0.2],
		curve: 'exponential'
	).kr(gate: Impulse.kr(1/13), timeScale: 10);

	snd = PitchShift.ar(
		in: playbuf,
		windowSize: 1.0,
		pitchRatio: [0.7, 0.6],
		pitchDispersion: env2,
		timeDispersion: 0.5
	);
	snd = snd * SinOsc.ar([5, 7]).range(0.3, 1);
	snd = CombC.ar(
		in: snd * 0.5,
		maxdelaytime: 2.0,
		delaytime: [1.5, 1.88],
		decaytime: [0.2, 0.4],
		add: snd * 0.7
	);
	snd = Mix.ar(snd);
	Out.ar(out, snd * env);
}).add;


// ====================================
// Object10 = like Object2 but a few different parameters
// previously named Object2b in original patch
// ====================================

SynthDef("Object10", {arg in, out, buffer, gate = 1, recstop = 1;
	var snd, env, env2;

	RecordBuf.ar(
		inputArray: In.ar(in),
		bufnum: buffer,
		run: recstop
	);
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 1.3
	).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.4, 5.7],
		times: [0.4, 0.56], // modified by Bruno (was 0.4, 1.56)
		curve: 'exponential'
	).kr(timeScale: 10);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		loop: 1
	);
	snd = PitchShift.ar(
		in: snd,
		windowSize: 1.0,
		pitchRatio: 2.4, // modified by Bruno (was 1.4)
		pitchDispersion: 0.3 + env2,
		timeDispersion: 0.7
	);
	Out.ar(out, snd * env);
}).add;


// ====================================
// Object11 = Grainy Sound High [Grainy Sound High]
// plus reverse reverb
// ====================================

SynthDef("Object11", {arg in, out, gate = 1;
	var snd, snd2, env, env2, buf;
	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 0.8,
		releaseTime: 3
	).kr(gate: gate, doneAction: 2);
	env2 = Env.new(
		levels: [0.0001, 0.05, 1.5],
		times: [0.0001, 0.1],
		curve: 'exponential'
	).kr(gate: Impulse.kr(1/4), timeScale: 2);
	snd = PitchShift.ar(
		in: In.ar(in),
		windowSize: 0.1,
		pitchRatio: [1.0, 1.5, 2.0, 3.5] * LFPulse.kr(LFNoise1.kr(3).range(1/2, 3)).range(0.5, 1),
		pitchDispersion: 0.0,
		timeDispersion: 0.1 + env2
	);

	snd = Mix.ar(snd);

	buf = LocalBuf(SampleRate.ir * 4);
	RecordBuf.ar(
		inputArray: FreeVerb.ar(snd, 0.8, 0.8),
		bufnum: buf,
		recLevel: 0.8,
		preLevel: 0.4
	);
	snd2 = PlayBuf.ar(
		numChannels: 1,
		bufnum: buf,
		rate: -1,
		loop: 1
	);

	snd = snd + snd2;
	snd = Mix.ar(snd);
	snd = HPF.ar(snd, 500);
	Out.ar(out, snd * env);
}).add;

// ====================================
// Object12 = Large Grain With Env [Grainy Sound Low]
// ====================================

SynthDef("Object12",{arg  in, out, gate = 1;
	var env, env2, pshift, pshift2, panstereo, panstereo2, mix;
	env = Env.asr(0.1, 0.8, 1.3).kr(gate: gate, doneAction: 2);
	env2 = Env.new([0.0001, 0.05, 1.5], [0.0001, 0.1], 'exponential').kr(timeScale: 8);

	pshift = PitchShift.ar(In.ar(in),0.2,0.8,0.3,0.1+env2);
	pshift2 = PitchShift.ar(pshift,0.24,1.0,0.5,0.05);
	panstereo = Pan2.ar(pshift, SinOsc.ar(3.3));
	panstereo2 = Pan2.ar(pshift2, SinOsc.ar(7.54));

	mix = Mix.new(panstereo + panstereo2);
	Out.ar(out, mix);
}).add;

// ====================================
// Object13 = Pitch Shift With Env and FreqShift [Pitch Modulation]
// ====================================
SynthDef("Object13",{arg in, out, gate = 1;
	var pshift, panstereo, env, envelop,lfo;

	env = Env.asr(0.1, 0.8, 4).kr(gate: gate, doneAction: 2);
	lfo = SinOsc.ar(freq: 0.12, mul: [0.7, 0.2, 0.01]);
	pshift = PitchShift.ar(
		in: In.ar(in),
		windowSize: 0.1,
		pitchRatio: 1.3 + lfo
	);
	pshift = Mix.ar(pshift);
	pshift = pshift + FreqShift.ar(pshift, 10);
	panstereo = Pan2.ar(pshift, SinOsc.kr(freq: 2.3, mul: 0.3));
	Out.ar(out, panstereo * env);
}).add;





 // end of all SynthDefs



/*

~micBus = Bus.audio(s, 1);
~buf1 = Buffer.alloc(s, s.sampleRate * 1.0, 1);
~micSynth = Synth("MicBuffer", [\out, ~micBus]);


// Reverb example
~rv = Synth.after(~micSynth, "Reverb", [\in, ~micBus, \out, 0]);
~rv.free;

// Object 1 example
~o1 = Synth.after(~micSynth, "Object1", [\in, ~micBus, \out, 0]);
~o1.release;

// Object 2 example
~o2 = Synth.after(~micSynth, "Object2", [\in, ~micBus, \out, 0, \buffer, ~buf1]);
~o2.release;

// Object 2b example
~o2b = Synth.after(~micSynth, "Object2b", [\in, ~micBus, \out, 0, \buffer, ~buf1]);
~o2b.release;

// Object 3 example
~o3 = Synth.after(~micSynth, "Object3", [\in, ~micBus, \out, 0, \buffer, ~buf1]);
~o3.release;

// Object 4 example
~o4 = Synth.after(~micSynth, "Object4", [\in, ~micBus, \out, 0, \buffer, ~buf1]);
~o4.release;

// Object 5 example
~o5 = Synth.after(~micSynth, "Object5", [\in, ~micBus, \out, 0, \buffer, ~buf1]);
~o5.release;

*/
