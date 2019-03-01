(
// run every 2 seconds, move mouse around
Ndef(\a).fadeTime = 2;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 10, // release
		level: 0.4, // main volume
		curve: -1 // concave or convex shape
	).kr;
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: 43 * rrand(10, 15) * [1, 1.001, 2, 2.01],
		mul: 0.5
	);
	snd = LPF.ar(snd, SinOsc.ar(MouseX.kr(1, 12)).range(20, 4000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)