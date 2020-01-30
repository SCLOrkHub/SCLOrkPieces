// ORIGINAL (do not live code on this one)
(
Pbindef(\p19).stop;
Pbindef(\p20,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, -3, 2, 3s, 2, 3s, 2], inf),
	\dur, Pseq([Pn(0.25, 4), 0.75, 0.25, Pn(0.25, 4)], inf),
    \amp, Pseq([
		0.7, 0.5, 0.4, 0.3,
		0.4, 0.3,
		0.3, 0.4, 0.5, 0.6
	], inf),
    \legato, 0.7
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p19).stop;
Pbindef(\p20,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, -3, 2, 3s, 2, 3s, 2], inf),
	\dur, Pseq([Pn(0.25, 4), 0.75, 0.25, Pn(0.25, 4)], inf),
    \amp, Pseq([
		0.7, 0.5, 0.4, 0.3,
		0.4, 0.3,
		0.3, 0.4, 0.5, 0.6
	], inf),
    \legato, 0.7
).play(~clock, quant: 1).quant = 1;
)