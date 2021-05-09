// ++ code copied from josh
(
Ndef(\grainy).fadeTime = 10;
Ndef(\grainy, {
	var snd = RHPF.ar(Dust.ar(4), [43 * 128, 43 * 64] * 2, [0.03, 0.05]);
	snd = snd + AllpassC.ar(snd, 0.1, SinOsc.ar([1, 0.75]).range(15, 20).reciprocal, 5);
	snd = [snd[0] + snd[1], snd[0] - snd[1]];
	snd = Pan2.ar(Mix(snd), SinOsc.ar(1/4));
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
);
// -- end of copied code
