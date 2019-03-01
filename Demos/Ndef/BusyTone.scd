(
// run every few seconds
Ndef(\a).fadeTime = 0.1;
Ndef(\a, {
	var snd = LFPar.ar(
		freq: 43 * rrand(25, 29) * [1, 1.001, 0.99, 1.01],
		mul: LFPulse.ar(2).range(0.0, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
	snd;
}).play;
)