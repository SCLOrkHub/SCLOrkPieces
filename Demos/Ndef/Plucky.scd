(
Ndef(\test).fadeTime = 5;
Ndef(\test, {
	var snd, freqs;
	freqs = 43 * Rand(2, 10) * [1, 0.99, 1.01, 2]; // pick harmonic number
	snd = Pluck.ar(
		in: WhiteNoise.ar,
		trig: Impulse.ar(1/Rand(1.5, 4.0)),
		delaytime: freqs.reciprocal,
		decaytime: 7,
		coef: 0.1
	);
	snd = LPF.ar(snd, LFTri.ar(Rand(1/2, 4.0)).range(1000, 5000));
	snd = Pan2.ar(Mix(snd), Rand(-1.0, 1.0));
	snd = Limiter.ar(snd) * 0.1;
}).play;
)

Ndef.clear