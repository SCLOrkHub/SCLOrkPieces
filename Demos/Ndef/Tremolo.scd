(
Ndef(\a).fadeTime = 0.05;
Ndef(\a, {
	var snd = LFPar.ar(
		freq: 43 * [4, 8, 10].choose *
		[1, 1.001, 0.99, 0.5] *
		LFPulse.ar([4,5].choose).range(1, 1.5),
		mul: LFNoise2.ar(MouseX.kr(1, 6)).range(0.002, 0.5)
	);

	snd = LPF.ar(snd, SinOsc.ar(1/10).range(150, 19000));
	snd = FreeVerb.ar(snd, 0.19);
	snd = snd.distort.distort.distort;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
	snd;
}).play;
)