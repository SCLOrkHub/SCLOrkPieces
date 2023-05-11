
~bpm.(155)

(
Ndef(\shakerSample).quant = 12;
Ndef(\shakerSample,
	Pbind(
		\instrument, "pb1",
		\buf, d.legua1,
		\dur, 12,
		\amp, 1,
		\rate, 1
)).play;
)






(
Ndef(\tabla).quant = 12;
Ndef(\tabla, Pbind(
	\instrument, "pb2",
	\buf, d.tabla1,
	\dur, 12,
	\rate, 0.5 * -0.5.midiratio,
	\amp, 1
)).play;
)


(
Ndef(\tabla2).quant = 12;
Ndef(\tabla2, Pbind(
	\instrument, "pb2",
	\buf, d.tabla1,
	\dur, 3,
	\rate, Pseq([1, 2, 3.midiratio, 2], inf) * -0.5.midiratio,
	\amp, Pseq([1, 0.8, 0.5, 0.4], inf)
)).play;
)


(
var samples, stretch = 3;
samples = [\cp0, \cp0, \cp1];
// samples = [\cp0, \r, \cp1, \r, \cp0, \cp1!2];
// samples = [\cp0, \cp0, \cp1, \cp0, \cp1, \d0!2];
samples = [\cp0, \cp0, \db1, \cp0, \cp1, \db10!2];
samples = [\cp0, \cp0, \db1, \cr4, [\cp0, \feel1], \db10!2];
samples = [\cp0, \feel1, \db1, \cr4, [\cp0, \feel1], \db10!2];

// samples = [\cp0, \feel1, \db1, \cr4, [\cp0, \feel1], \db10!2, \flick12];

// samples = [\cp0, \feel1, \db1, \cr4, [\cp0, \feel1], \db10!2, \flick6, \cp0, \cp0]; stretch = 6;

Ndef(\clap).quant = 12;
Ndef(\clap,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, stretch,
		\amp, Pseq([0.8, 0.6, 0.9], inf) * 1,
		\rate, 2,
	);
).play
)


Ndef(\clap).stop(10);

(
Ndef(\drone).fadeTime = 1;
Ndef(\drone, {
	var harmonic, snd, root;
	root = 36.midicps;
	harmonic = 1;
	snd = LFTri.ar(
		freq: root * harmonic * Array.rand(4, 0.99, 1.01),
		mul: LFTri.ar(1/5).range(0, 1)
	);
	snd = BPF.ar(
		in: snd,
		freq: root*3,
		rq: 0.2,
		mul: 0.3
	);
	// snd = FreeVerb.ar(snd, 0.5, 0.8);
	snd = Mix(snd); // don't change this line
	snd = Limiter.ar(snd); // don't change this line
}).play;
)






/*
(
Ndef(\bass).quant = 4;
Ndef(\bass, // customize name
	Pbind(
		\instrument, "ksBass",
		\dur, d.legua1.duration * 3,
		\midinote, 38-12,
		\amp, 0.5,
		\ctranspose, [-12, 0],
		\att, 1,
		\rel, 4,
	)
).play;
)












Ndef.clear















(
SynthDef("shaker", {
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

~bpm.(151);

(
Ndef(\shakerP).quant = 6;
Ndef(\shakerP, Pbind(
	\instrument, "shaker",
	\dur, 0.5,
	\amp, Pseq([0.8, 0.2, 0.2, 0.5, 0.2, 0.2], inf),
	\ffreq, Pseq([5100, 1600, 1600, 1400, 1210, 1100], inf) + Pwhite(-30, 130),
	\envDur, Pwhite(0.2, 0.23),
	\amp, Pseq([1, 0.2, 0.4, 0.7, 0.2, 0.6], inf),
	\rq, 0.5
)).play;
)

Ndef.clear