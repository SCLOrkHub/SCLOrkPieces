// bruno

// SCLOrkSynths.gui;

(
Ndef(\tt).quant = 4;
Ndef(\tt,
	Pbind(
		\instrument, "modalMarimba",
		\ctranspose, Pseq([-12, 0, -12, 24], inf) + [0, 7] + 7,
		\dur, Pseq([0.5, 1, 0.5, 1.5, 0.5, 0.25, 0.25, 0.5], inf) * 1,
		\degree, Pseq([0, 2, 4, 6, 7, Pwhite(7, 10, 2)], inf),
		\amp, Pseq([Pwhite(0.15, 0.2, 4), 0.1], inf),
		\rel, Pwhite(1, 5),
		\att, 0.01,
		\position, Pwhite(0.1, 0.9),
		\pan, Pwhite(-0.7, 0.7),
		\decCoef, Pwhite(0.1, 0.75)
	)
).play;
)


(
Ndef(\fx).fadeTime = 2;
Ndef(\fx, {
	var snd;
	snd = Ndef(\tt);
	snd = RHPF.ar(
		in: snd,
		freq: SinOsc.ar(1/[2, 3]).range(100, 3450),
		rq: 0.5,
		mul: 1
	);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.505,
		room: 0.87,
		damp: 0.57,
		mul: 1
	);
	snd = snd + PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		pitchRatio: Line.kr(0.1, 4, 30),
		pitchDispersion: Line.kr(2, 5, 30),
		timeDispersion: Line.kr(1, 5, 30),
		mul: 0.4
	);
	snd = Splay.ar(snd);
}).play;
)

