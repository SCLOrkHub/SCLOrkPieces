// ==================================
// Preset: Sophia-1
// Number of voices: 3
// Most recent year sampled: 2011
// Comments:
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1923C'),
	\dur, 1/8,
	\rate, 1.01,
	\startPos, 0.01,
	\att, 0.001,
	\rel, Pwhite(0.5, 1.1),
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 1, 0, // beat 1
		1, 0, 0, 0, 0, 0, 1, 0,// beat 2
		1, 0, 0, 0, 0, 0, 1, 0,// beat 3
		1, 0, 0, 0, 1, 0, 1, 1,// beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2009B'),
	\dur, 1,
	\rate, 1,
	\startPos, 0.3,
	\att, 1,
	\rel, 4,
	\amp, 0.5
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2011A'),
	\dur, 1,
	\rate, 1,
	\startPos, 0.3,
	\att, 1,
	\rel, 4,
	\amp, 0.5
).play(~clock, quant: 4).quant = 4;
