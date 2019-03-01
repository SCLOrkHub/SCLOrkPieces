(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 7, // release
		level: 0.7, // main volume
		curve: -4 // concave or convex shape
	).kr;
	var noise = WhiteNoise.ar;
	var snd = Klank.ar(`[[0.97, 0.98, 0.99, 1.0, 1.01, 1.02, 1.03], nil, nil],
		noise, 43 * 2);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd) * env;
	snd;
}).play;
)