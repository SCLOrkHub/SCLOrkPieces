// ORIGINAL (do not live code on this one)
(
Pbindef(\p13).stop;
Pbindef(\p14,
	\instrument, ~mySynth,
    \degree, Pseq([7, 6, 4, 3s], inf),
    \dur, 4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p13).stop;
Pbindef(\p14,
	\instrument, ~mySynth,
    \degree, Pseq([7, 6, 4, 3s], inf),
    \dur, 4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)