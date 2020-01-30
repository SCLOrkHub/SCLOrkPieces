// ORIGINAL (do not live code on this one)
(
Pbindef(\p18).stop;
Pbindef(\p19,
	\instrument, ~mySynth,
    \degree, Pseq([\rest, 11], inf),
	\dur, Pseq([Rest(1.5), 1.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p18).stop;
Pbindef(\p19,
	\instrument, ~mySynth,
    \degree, Pseq([\rest, 11], inf),
	\dur, Pseq([Rest(1.5), 1.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)