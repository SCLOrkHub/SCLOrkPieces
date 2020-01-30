// ORIGINAL (do not live code on this one)
(
Pbindef(\p15).stop;
Pbindef(\p16,
	\instrument, ~mySynth,
    \degree, Pseq([4, 6, 7, 6], inf),
	\dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p15).stop;
Pbindef(\p16,
	\instrument, ~mySynth,
    \degree, Pseq([4, 6, 7, 6], inf),
	\dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)