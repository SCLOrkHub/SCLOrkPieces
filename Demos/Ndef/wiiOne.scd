(
// press A button to make sound
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd = LFPar.ar(
		freq: 43 * ~wiiX.kr.range(2, 22).round(1.0) * Array.rand(20, 0.99, 1.01),
		mul: ~wiiY.kr.range(0, 1).lag(1)
	);
	snd = LFTri.ar(~wiiX.kr.range(0.1, 6)) * snd;
	snd = snd * ~wiiA.kr;
	snd = Mix.ar(snd);
		snd = SelectX.ar(
		which: ~wiiZ.kr.range(0, 1).lag(1),
		array: [ snd, FreeVerb.ar(snd, 0.5, 0.9, 0.7) ]
	);

	snd = Limiter.ar(snd);
}).play;
)

