(
// remember to change name!!!!!!!!!!!!!
Ndef(\bruno).fadeTime = 1;
Ndef(\bruno, {
	var snd = LFTri.ar(
		freq: 43
		* LFNoise0.ar(4).range(24, 32).round(1.0)
		* LFNoise2.ar(Array.rand(16, 0.2, 0.3)).range(0.99, 1.01)
		* Line.ar(0, -4, 20).midiratio.round(0.3)
		* [0, 4, 7].midiratio
		,
		mul:
		LFTri.ar(XLine.ar(6, 2.0, 17)).range(0, 0.1)
		* XLine.ar(1, 0.5, 20)
		* LFNoise2.ar(1/[2,3,4])
		// volume
	);
	snd = snd.distort.distort.distort.tanh;
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: Array.rand(6, 0.1, 0.5),
		decaytime: Array.rand(6, 1, 5)
	);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.3,
		room: 0.5,
		damp: 0.8
	);
	snd = Pan2.ar(in: Mix(snd), pos: LFNoise2.ar(1));
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
)

Ndef(\bruno).stop(3);