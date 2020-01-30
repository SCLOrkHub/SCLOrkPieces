// ORIGINAL (do not live code on this one)
(
Pbindef(\p3).stop;
Pbindef(\p4,
	\instrument, ~mySynth,
    \degree, Pseq([\rest, 2, 3, 4], inf),
    \dur, Pseq([Rest(0.5), 0.5, 0.5, 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p3).stop;
Pbindef(\p4,
	\instrument, ~mySynth,
    \degree, Pseq([\rest, 2, 3, 4], inf),
    \dur, Pseq([Rest(0.5), 0.5, 0.5, 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)