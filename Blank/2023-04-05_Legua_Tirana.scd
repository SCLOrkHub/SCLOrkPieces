

(
SynthDef("chocalho", {
	var snd, env;
	var envDur = \envDur.kr(1);
	// env = Env.triangle(\envDur.kr(1), \amp.kr(0.1)).kr;
	env = Env.perc(envDur/2, envDur/2, \amp.kr(0.1), [3, -3]).kr;
	// snd = WhiteNoise.ar(1.0);
	snd = Dust.ar(2500) + WhiteNoise.ar(LFNoise2.kr(1).range(0, 1));
	snd = BPF.ar(
		in: snd,
		freq: \ffreq.kr(1000) * LFTri.kr(1).range(1, 1.4),
		rq: \rq.kr(0.5)
	);
	snd = snd * env;
	snd = snd.distort.tanh;
	snd = Pan2.ar(Mix(snd), \pan.kr(0));
	// snd = FreeVerb.ar(snd, 0.4, 0.5, 0.99);
	snd = Limiter.ar(snd);
	Out.ar(0, snd);
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)


~bpm = TempoClock.new(151/60).permanent_(true);

(
a = Pbind(
	\instrument, "chocalho",
	\dur, 0.5,
	\amp, Pseq([0.8, 0.2, 0.2, 0.5, 0.2, 0.2], inf),
	\ffreq, Pseq([2100, 1600, 1600, 1400, 1210, 1100], inf) + Pwhite(-30, 130),
	\envDur, Pwhite(0.2, 0.4)
).play(~bpm);

b = Pbind(
	\instrument, "chocalho",
	\dur, Pseq([
		Pwhite(0.249, 0.251, 2), 0.5, 0.45, 0.55, 0.5, 0.51,
		0.5, 0.45, 0.55, 0.5, 0.51, 0.49
	], inf),
	\amp, Pseq([
		Pwhite(0.4, 0.79, 2), 0.7, 0.19, 0.2, 0.5, 0.21,
		0.19, 0.2, 0.5, 0.21, 0.2, 0.2

	], inf),
	\ffreq, Pseq([
		Pwhite(2600, 3100, 3), 1600, 1200, 2700, 1510,
		1400, 1600, 1200, 1500, 1510, 1600,

	], inf) + Pwhite(-30, 130),
	\envDur, 0.3,
	\rq, Pwhite(0.3, 0.6)
).play(~bpm);

)



/*
(
SynthDef(\distortedGuitar, {
	arg
	//Standard Values
	out = 0, pan = 0, amp = 0.1, freq = 220, rel = 4, crv = -3,
	// String and Plucking Hand Controls
	coef = 0.75, openStringFreq = 110, pickPos = 0.5, muteSus = 0.5,
	// Pickup Controls
	pickupPos = 0.17, pickupResfreq = 8000, pickupResrq = 0.5, pickupHPF = 250, pickupHPFrq = 0.8,
	// Distortion Controls
	preDistHPF = 600, postDistLPF = 2000, gain = 75;

	var mute, snd;

	// The Pick
	snd = Hasher.ar(Sweep.ar(Impulse.ar(0)));
	snd = snd - DelayN.ar(
		in: snd,
		maxdelaytime: pickPos.clip(0, 1)/freq,
		delaytime: pickPos.clip(0, 1)/freq);

	// The String
	snd = Pluck.ar(
		in: snd,
		trig: Impulse.ar(0),
		maxdelaytime: 1/freq,
		delaytime: 1/freq,
		decaytime: rel,
		coef: coef.clip(-1, 1));
	snd = LeakDC.ar(snd);

	// An Envelope for Muting the String
	mute = Env.new(
		levels: [1, 1, 0, 0],
		times: [muteSus, 0.075, 0.025]).ar;

	// Mute the String
	snd = snd * mute;
	snd = HPF.ar(
		in: snd,
		freq: LinExp.ar(
			in: mute,
			srclo: 0, srchi: 1,
			dstlo: 100, dsthi: 20));
	snd = LPF.ar(
		in: snd,
		freq: LinExp.ar(
			in: mute,
			srclo: 0, srchi: 1,
			dstlo: 20, dsthi: 10000));

	// The Pickup
	snd = snd - DelayN.ar(
		in: snd,
		maxdelaytime: pickupPos.clip(0, 1)/openStringFreq,
		delaytime: pickupPos.clip(0, 1)/openStringFreq);
	snd = RHPF.ar(
		in: snd,
		freq: pickupHPF,
		rq: pickupHPFrq);
	snd = BLowPass4.ar(
		in: snd,
		freq: pickupResfreq,
		rq: pickupResrq);

	snd = LeakDC.ar(snd);

	// The Distortion
	snd = HPF.ar(
		in: snd,
		freq: preDistHPF);
	snd = snd * gain;
	snd = snd.tanh;
	snd = LPF.ar(
		in: snd,
		freq: postDistLPF);

	// Output Stuff
	snd = snd * amp;

	// snd = Normalizer.ar(snd, Env.perc(0.001, rel).kr);
	snd = Limiter.ar(snd);

	DetectSilence.ar(in: snd, doneAction: 2);

	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "Josh Mitchell",
	category: \guitar,
	tags: [\pitched]
	)
).add;
)


);
// Pattern demo
(
var score = [
	[62, 1],
	[65, 1],
	[69, 2],
	[65, 1],
	[67, 2],
	[65, 1],
	[69, 2],
	[67, 2],
	[62, 1],
	[65, 1],
	[67, 1],
	[62, 1],
];
Pbind(
	\instrument, "distortedGuitar",
	\ctranspose, 0,
	\amp, 0.2,
	\midinote, Pseq([
		\rest,    62,    65,
		69,              65,
		67,              65,
		69,

	], inf
	),
	\dur, Pseq([
		Rest(1),    1,    1,
		2,                1,
		2,                1,
		2,                1,

	], inf
	),
	// \openStringFreq, [110, 147, 196] * Prand([1, 1, 2], inf),
	\pickPos, 0.5, //Pwhite(0.2, 0.8),
	\muteSus, 4, //Pseq([Pseq([
	\rel, 5
).play(TempoClock.new(3));
);

Pbind(\midinote, 62).play