(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var snd = LFSaw.ar(
		freq: 43 * [0.5, 0.51, 0.52, 0.53],
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)