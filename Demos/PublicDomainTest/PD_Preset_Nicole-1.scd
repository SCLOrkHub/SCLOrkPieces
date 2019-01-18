// ==================================
// Preset: Nicole-1
// Number of voices: 4
// Most recent year sampled: 2012
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 4,
	\rate, Pseq ([1, 1, 1.1, 1.1], inf),
	\startPos, 0.5,
	\att, 0.5,
	\rel, 10,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2012A'),
	\dur, 4,
	\rate, 2,
	\startPos, 0,
	\att, 1,
	\rel, 5,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1986A'),
	\dur, 4,
	\rate, 0.3,
	\startPos, 0,
	\att, 0.4,
	\rel, 5,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1923C'),
	\dur, 4,
	\rate, 0.5,
	\startPos, 0,
	\att, 0.05,
	\rel, 10,
	\amp, 0.5
).play(~clock, quant: 4).quant = 4;