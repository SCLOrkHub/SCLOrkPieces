(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)