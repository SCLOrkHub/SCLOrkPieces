// demo 0

(
Ndef(\myFirstDemo).quant = 4;
Ndef(\myFirstDemo,
	Pbind(
		\degree, Pseq([0, 3, 2, 1], inf),
		\dur, 1,
		\amp, 0.2,
		\ctranspose, 0,
		\legato, 1
	)
).play;
)

Ndef(\myFirstDemo).stop;
