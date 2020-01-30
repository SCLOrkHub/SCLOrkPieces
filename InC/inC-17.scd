// ORIGINAL (do not live code on this one)
(
Pbindef(\p16).stop;
Pbindef(\p17,
	\instrument, ~mySynth,
    \degree, Pseq([6, 7, 6, 7, 6, \rest], inf),
	\dur, Pseq([Pn(0.25, 5), Rest(0.25)], inf),
    \amp, 0.5,
	\legato, Pseq([Pn(0.8, 4), 0.2, \rest], inf)
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p16).stop;
Pbindef(\p17,
	\instrument, ~mySynth,
    \degree, Pseq([6, 7, 6, 7, 6, \rest], inf),
	\dur, Pseq([Pn(0.25, 5), Rest(0.25)], inf),
    \amp, 0.5,
	\legato, Pseq([Pn(0.8, 4), 0.2, \rest], inf)
).play(~clock, quant: 1).quant = 1;
)