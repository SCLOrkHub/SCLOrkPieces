// ORIGINAL (do not live code on this one)
(
Pbindef(\p12).stop;
Pbindef(\p13,
	\instrument, ~mySynth,
    \degree, Pseq([6, 4, 4, 3, 4, \rest, 4], inf),
	\dur, Pseq([0.25, 0.75, 0.25, 0.25, 0.5, Rest(0.75), 3.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p12).stop;
Pbindef(\p13,
	\instrument, ~mySynth,
    \degree, Pseq([6, 4, 4, 3, 4, \rest, 4], inf),
	\dur, Pseq([0.25, 0.75, 0.25, 0.25, 0.5, Rest(0.75), 3.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)