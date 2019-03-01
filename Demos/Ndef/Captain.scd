(
Ndef(\a, {
	var snd = Klang.ar(`[
			Array.fill(32, { | i | i + 1}),
			Array.fill(32, { | i | 1.0 / (i + 1.0)}),
			nil
		], freqscale: 23);
	BPF.ar(
		in: snd,
		freq:
		43 * MouseX.kr(1, 15).round(1),
		rq: MouseY.kr(0.01, 1.2),
		mul: 1)
}).play;
)