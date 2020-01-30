// ORIGINAL (do not live code on this one)
(
Pbindef(\p11).stop;
Pbindef(\p12,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6, 7], inf),
    \dur, Pseq([0.5, 0.5, 4, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
