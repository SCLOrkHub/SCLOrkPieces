(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 40,
		mul: LFSaw.ar(1).range(0, 1)
	)
}).play;
)