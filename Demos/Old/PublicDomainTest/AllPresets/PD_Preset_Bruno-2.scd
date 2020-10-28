// ==================================
// Preset: Bruno-2
// Number of voices: 4
// Most recent year sampled: 1985
// Comments:
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 4,
	\rate, 120/124,
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 4,
	\rate, 120/124 * Pseries(1, 0.005, inf),
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 4,
	\rate, 120/124 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 8,
	\rate, 120/124 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.5,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([Pn(0, 12), Pseq([1, 0.9, 0.5, 0], inf)])
).play(~clock, quant: 4).quant = 4;
