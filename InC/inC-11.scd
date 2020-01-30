// ORIGINAL (do not live code on this one)
(
Pbindef(\p10).stop;
Pbindef(\p11,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6, 4, 6, 4], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p10).stop;
Pbindef(\p11,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6, 4, 6, 4], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)