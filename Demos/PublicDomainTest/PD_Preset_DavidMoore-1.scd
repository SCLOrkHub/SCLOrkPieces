// ==================================
// Preset: DavidMoore-1
// Number of voices: 7
// Most recent year sampled: 2017
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4,
	\rate, 0.5,
	\startPos, 0.445,
	\att, 0.05,
	\rel, 10,
	\amp, 0.5
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2011A'),
	\dur, 2/8,
	\rate, 0.7,
	\startPos, 0.0026,
	\att, 0.01,
	\rel, 1,
	\amp, Pseq([
		1, 0, 0, 0,   1, 0, 0, 0, // beat 1
		1, 0, 0, 0,   1, 0, 0, 0, // beat 2
		1, 0, 0, 0,   1, 0, 0, 0, // beat 3
		1, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 2.5,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2017A'),
	\dur, 1/8,
	\rate, 0.73,
	\startPos, Pseq([0.001,0.05,0.05,0.001],inf),
	\att, 0.02,
	\rel, 0.1,
	\amp, Pseq([
		1, 0, 1, 0,   0, 1, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 0, 1, 0,   0, 1, 0, 0, // beat 3
		1, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf) * 0.154,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4/8,
	\rate, 0.67,
	\startPos, 0.85,
	\att, 0.03,
	\rel, 2,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 1, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 1, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf) * 0.5,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4/8,
	\rate, 0.50,
	\startPos, 0.1,
	\att, 0.05,
	\rel, 4,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 0.3,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 1/16,
	\rate, 1,
	\startPos, Pwhite(0.85,0.86,inf),
	\att, 0.1,
	\rel, 1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0.05, 0.1, 0.2, 0.3,   0.4, 0.6, 0.8, 1,
        0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0 ,0,
	], inf) * 0.21,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4/8,
	\rate, 0.50,
	\startPos, 0.32,
	\att, 0.05,
	\rel, 4,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf) * 0.3,
).play(~clock, quant: 4).quant = 4;
