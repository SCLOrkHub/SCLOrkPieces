// ==================================
// Preset: Kaitlin-2
// Number of voices: 4
// Most recent year sampled: 1921
// Comments: old marching band looping detuning overtime
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 4,
	\rate, 120/124,
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 4,
	\rate, 120/124 * Pseries(1, 0.005, inf),
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 4,
	\rate, 120/124 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 8,
	\rate, 120/124 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.5,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;
