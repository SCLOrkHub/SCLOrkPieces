(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 5, // release
		level: 0.4, // main volume
		curve: -4 // concave or convex shape
	).kr;
	var midinotes = Dseq([67, 69, 65, 53, 60], inf).midicps;
	var trigger = Impulse.kr(4);
	var snd = LFSaw.ar(
		freq: Demand.kr(trigger, 0, midinotes),
		mul: 0.5
	);
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
