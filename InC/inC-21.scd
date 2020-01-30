// ORIGINAL (do not live code on this one)
(
Pbindef(\p20).stop;
Pbindef(\p21,
	\instrument, ~mySynth,
    \degree, 3s,
    \dur, 3,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p20).stop;
Pbindef(\p21,
	\instrument, ~mySynth,
    \degree, 3s,
    \dur, 3,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)