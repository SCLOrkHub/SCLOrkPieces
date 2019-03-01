(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd = [LFSaw, SinOsc, LFPulse].choose.ar(
		freq: 43 *
		XLine.ar(
			start: rrand(10, 15),
			end: 1,
			dur: [12, 13, 14].choose) *
		[1, 1.01, 1.5, 2.001],
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = LPF.ar(snd, 12000);
	snd = Limiter.ar(snd);
}).play;
)