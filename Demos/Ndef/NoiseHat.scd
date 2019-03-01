(
Ndef(\a, {
	var snd = WhiteNoise.ar(1);
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3).range(1000, 9000),
		mul: 0.3
	);
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)