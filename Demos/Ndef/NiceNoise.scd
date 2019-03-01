(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var snd = LFSaw.ar(
		freq: WhiteNoise.kr(8).range(100, 172),
		mul: LFPulse.kr(LFNoise0.kr(1/3).range(1/3, 1)).range(0, 1)
	);
	snd = RLPF.ar(snd, SinOsc.kr(5).range(4300, 7000), 1/15);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)