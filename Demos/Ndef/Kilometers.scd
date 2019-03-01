(
Ndef(\a, {
	var snd = LFPulse.ar(
		freq: BrownNoise.kr(4).range(MouseX.kr(86, 86*2)),
		mul: LFPulse.kr(3).range(0, 1)
	);
	snd = RLPF.ar(
		in: snd,
		freq: LFPulse.kr(5).range(43, 7000),
		rq: 1/15
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

