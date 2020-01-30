// ORIGINAL (do not live code on this one)
(
Pbindef(\p8).stop;
Pbindef(\p9,
	\instrument, ~mySynth,
	\degree, Pseq([6, 4, Pn(\rest, 4)], inf),
	\dur, Pseq([0.25, 0.25, Rest(0.5), Pn(Rest(1), 3)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p8).stop;
Pbindef(\p9,
	\instrument, ~mySynth,
	\degree, Pseq([6, 4, \rest], inf),
	\dur, Pseq([0.25, 0.25, Rest(3.5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
