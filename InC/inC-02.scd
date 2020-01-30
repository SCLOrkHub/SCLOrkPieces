// ORIGINAL (do not live code on this one)
(
Pbindef(\p1).stop;
Pbindef(\p2,
	\instrument, ~mySynth,
    \degree, Pseq([0, 2, 3, 2], inf),
    \dur, Pseq([0.05, 0.45, 0.5, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p1).stop;
Pbindef(\p2,
	\instrument, ~mySynth,
    \degree, Pseq([0, 2, 3, 2], inf),
    \dur, Pseq([0.05, 0.45, 0.5, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)