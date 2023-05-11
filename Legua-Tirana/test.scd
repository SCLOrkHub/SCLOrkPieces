(
Ndef(\shaker, {
	var snd, env;
	var envDur = \envDur.kr(0.2);
	// env = Env.triangle(\envDur.kr(1), \amp.kr(0.1)).kr;
	env = Env.perc(
		attackTime: envDur/2,
		releaseTime: envDur/2,
		level: \amp.kr(1),
		curve: [3, -3]
	).kr(gate: \gate.tr(1));
	// snd = WhiteNoise.ar(1.0);
	snd = Dust.ar(2500) + WhiteNoise.ar(LFNoise2.kr(1).range(0, 1));
	snd = BPF.ar(
		in: snd,
		freq: \ffreq.kr(1000) * LFTri.kr(1).range(1, 1.4),
		rq: \rq.kr(0.5)
	);
	snd = snd * env;
	snd = snd.distort.tanh;
	snd = Pan2.ar(Mix(snd));
	// snd = FreeVerb.ar(snd, 0.4, 0.5, 0.99);
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\shaker).set(\gate, 1);

(
Ndef(\shakerP, Pbind(
	\type, \set,
	\id, Ndef(\shaker).nodeID,
	\gate, 1,
	\dur, 0.5,
	\amp, Pseq([0.8, 0.2, 0.2, 0.5, 0.2, 0.2], inf),
	\ffreq, Pseq([2100, 1600, 1600, 1400, 1210, 1100], inf),
	\envDur, Pwhite(0.2, 0.25)
)).play(~bpm);
)



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