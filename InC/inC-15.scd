// ORIGINAL (do not live code on this one)
(
Pbindef(\p14).stop;
Pbindef(\p15,
	\instrument, ~mySynth,
    \degree, Pseq([4, \rest ], inf),
	\dur, Pseq([0.25, Rest(3.75)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p14).stop;
Pbindef(\p15,
	\instrument, ~mySynth,
    \degree, Pseq([4, \rest ], inf),
	\dur, Pseq([0.25, Rest(3.75)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)