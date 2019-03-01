(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = SinOsc.ar(
		freq: 43 * 4, // choose harmonic from 1 to 32
		mul: 0.5 // volume
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)