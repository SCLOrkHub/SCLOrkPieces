(
// press A button to make sound
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd = LFPar.ar(
		freq: 43 * ~wiiX.kr.range(2, 12).round(1.0).max(2).poll * Array.rand(20, 0.99, 1.01),
		mul: ~wiiY.kr.range(0, 1).lag(1)
	);
	snd = LFTri.ar(LFNoise2.kr(1).range(1, 6)) * snd;
	snd = snd * ~wiiA.kr;
	snd = Mix.ar(snd);
		snd = SelectX.ar(
		which: ~wiiB.kr,
		array: [ FreeVerb.ar(snd, 0.3, 0.4, 0.5), FreeVerb.ar(snd, 0.5, 0.9, 0.7) ]
	);

	snd = Limiter.ar(snd);
}).play;
)

