// ORIGINAL (do not live code on this one)
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3, 4, \rest], inf),
	\dur, Pseq([0.5, 0.5, 0.5, Rest(0.5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3, 4, \rest], inf),
	\dur, Pseq([0.5, 0.5, 0.5, Rest(0.5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)