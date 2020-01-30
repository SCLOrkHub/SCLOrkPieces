// ORIGINAL (do not live code on this one)
(
Pbindef(\p17).stop;
Pbindef(\p18,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 2, 2], inf),
	\dur, Pseq([Pn(0.25, 4), 0.75, 0.25], inf),
    \amp, 0.5,
    \legato, 0.6
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p17).stop;
Pbindef(\p18,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 2, 2], inf),
	\dur, Pseq([Pn(0.25, 4), 0.75, 0.25], inf),
    \amp, 0.5,
    \legato, 0.6
).play(~clock, quant: 1).quant = 1;
)