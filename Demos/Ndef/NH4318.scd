// Adapted from Nathan Ho
// https://scsynth.org/t/what-kind-of-synthesis-is-this/4318/16

(
Ndef(\nh4318).fadeTime = 0;
Ndef(\nh4318, {
	var trig, snd, freqs;
	trig = Impulse.ar(LFNoise2.kr(1).linexp(-1, 1, 1, 100));
	freqs = (60.5 + [0, 2, 4, 5, 7, 9, 10]).midicps;
	snd = Pluck.ar(
		in: Hasher.ar(Sweep.ar(trig)) * -10.dbamp,
		trig: trig,
		maxdelaytime: freqs.reciprocal,
		delaytime: freqs.reciprocal,
		decaytime: 0.9,
		coef: 0.5
	);
	snd = LeakDC.ar(snd).sum;
	snd = MoogFF.ar(
		in: snd,
		freq: LFNoise2.kr(1).linexp(-1, 1, 500, 16000),
		gain: 0
	);
	snd = Pan2.ar(snd, 0.0);
	snd = Limiter.ar(snd);
}).play;
)