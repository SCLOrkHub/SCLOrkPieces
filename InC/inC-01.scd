
// Stuff needed only to begin playing:

Pbindef.clear;
~clock = TempoClock.new(2).permanent_(true); // if not using a shared clock
~mySynth = "default"; // choose a synth here

// ORIGINAL (do not live code on this one)
(
Pbindef(\p1,
	\instrument, ~mySynth,
    \degree, Pseq([0, 2, 0, 2, 0, 2], inf),
    \dur, Pseq([0.05, 0.95], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p1,
	\instrument, ~mySynth,
    \degree, Pseq([0, 2, 0, 2, 0, 2], inf),
    \dur, Pseq([0.05, 0.95], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

