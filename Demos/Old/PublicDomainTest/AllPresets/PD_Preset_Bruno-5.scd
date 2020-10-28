// ==================================
// Preset: Bruno-5
// Number of voices: 5
// Most recent year sampled: 1976
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 16,
	\rate, -1,
	\startPos, 0.35,
	\att, 0.1,
	\rel, Pseq([25, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 16,
	\rate, -1 * Pseries(1, 0.005, inf),
	\startPos, 0.35,
	\att, 4,
	\rel, Pseq([35, 15, 25, 35], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 8.1,
	\rate, 1 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.39 + Pseries(0, 0.05, 10),
	\att, 6,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 8,
	\rate, 1 * Pn(Pseries(1, -0.009, 70)),
	\startPos, 0.45,
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([Pn(0, 12), Pseq([1, 0.9, 0.5, 0], inf)])
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 10,
	\rate, 1,
	\startPos, Pwhite(0.6, 0.9),
	\att, 5,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pwhite(0.5, 0.8)
).play(~clock, quant: 4).quant = 4;
