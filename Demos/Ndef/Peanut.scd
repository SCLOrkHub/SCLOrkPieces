(
Ndef(\a, {
	var snd = LFPulse.ar(
		freq: 43 * rrand(4, 4.1),
		mul: Saw.ar(1/3);
	);
	snd = LPF.ar(snd, MouseX.kr(150, 9600));
	snd = snd * LFPulse.ar(10, 0, 0.3);
	snd = Mix.ar(snd);
	snd = snd.distort.distort.distort;
	snd = Limiter.ar(snd);
}).play;
)