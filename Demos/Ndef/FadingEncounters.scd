(
Ndef(\a).fadeTime = 2;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 20, // release
		level: 0.4, // main volume
		curve: -1 // concave or convex shape
	).kr;
	// var midinotes = Drand([67, 69, 65, 53, 60], inf).midicps;
	var midinotes = Dseq([67, 69, 64, 53, 60], inf).midicps;
	// var midinotes = Dseq([67, 69, 72, 53, 60], inf).midicps;
	// var midinotes = Dseq([72, 74, 70, 53, 60], inf).midicps;
	var trigger = Impulse.kr(rrand(1, 2));
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: Demand.kr(trigger, 0, midinotes) * [1, 1.001, 2, 3] * XLine.kr(2, 1.4, 14),
		mul: 0.2
	);
	snd = LPF.ar(snd, SinOsc.ar(MouseX.kr(1, 12)).range(50, 4000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)