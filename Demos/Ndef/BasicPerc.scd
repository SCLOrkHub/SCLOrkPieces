(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = SinOsc.ar(
		freq: 43 * 3, // choose harmonic from 1 to 32
		mul: Env.perc(attackTime: 2,
			releaseTime: 8,
			level: 0.4
		).kr // volume
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

