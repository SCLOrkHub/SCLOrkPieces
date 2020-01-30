// ORIGINAL (do not live code on this one)
(
Pbindef(\p6).stop;
Pbindef(\p7,
	\instrument, ~mySynth,
	\degree, Pseq([
		Pn(\rest, 3),
		\rest, 0, 0, 0, \rest,
		Pn(\rest, 4)
	], inf),
	\dur, Pseq([
		Pn(Rest(1), 3),
		Rest(0.5), 0.25, 0.25, 0.5, Rest(0.5),
		Pn(Rest(1), 4)
	], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p6).stop;
Pbindef(\p7,
	\instrument, ~mySynth,
	\degree, Pseq([
		Pn(\rest, 3),
		\rest, 0, 0, 0, \rest,
		Pn(\rest, 4)
	], inf),
	\dur, Pseq([
		Pn(Rest(1), 3),
		Rest(0.5), 0.25, 0.25, 0.5, Rest(0.5),
		Pn(Rest(1), 4)
	], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)