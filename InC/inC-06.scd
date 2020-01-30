// ORIGINAL (do not live code on this one)
(
Pbindef(\p5).stop;
Pbindef(\p6,
	\instrument, ~mySynth,
    \degree, 7,
    \dur, 8,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p5).stop;
Pbindef(\p6,
	\instrument, ~mySynth,
    \degree, 7,
    \dur, 8,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)