// ORIGINAL (do not live code on this one)
(
Pbindef(\p7).stop;
Pbindef(\p8,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3], inf),
    \dur, Pseq([6, 8], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p7).stop;
Pbindef(\p8,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3], inf),
    \dur, Pseq([6, 8], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)