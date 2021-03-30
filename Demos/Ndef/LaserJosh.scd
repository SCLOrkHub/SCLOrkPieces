

// ++ code copied from josh
(
// remember to change name!!!!!!!!!!!!!
Ndef(\wow).fadeTime = 10;
Ndef(\wow, {
	var snd = SinOscFB.ar(
		freq: 43 * LFNoise0.ar(1).range(4, 8).round(1) * 4 * [6, 5, 7].scramble,
		feedback: LFTri.ar(0.5).range(0, 0.4) * LFNoise1.ar(0.1).range(1, 2),
		mul: 0.06 // volume
	);
	snd = Splay.ar(snd);
	snd = FreeVerb2.ar(snd[1], snd[0], 0.5, 0.9, 0);
	snd = Wrap.ar(snd * 50, -1, 1);
	snd = RLPF.ar(snd, 30 + (Decay2.ar(Dust.ar(2), 0.01, 0.075) * 7000), LFNoise1.ar(2).range(0.03, 0.1));
	snd = FreeVerb2.ar(snd[0], snd[1], 0.5, 0.75, 0.5);
	snd = Limiter.ar(snd) * 0.15; // another master volume control
}).play;
)
// -- end of copied code
