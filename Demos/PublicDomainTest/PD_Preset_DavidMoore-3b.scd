// ==================================
// Preset: DavidMoore-3
// Number of voices: 5
// Most recent year sampled: 2016
// Comments: variation by Bruno
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1996A'),
	\dur, 1/8,
	\rate, 0.98,
	\startPos, 0.023,
	\att, 0.001,
	\rel, 1,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 1/8,
	\rate, 1.01,
	\startPos, 0.01,
	\att, 0.001,
	\rel, Pwhite(0.5, 1.1),
	\amp, Pseq([
		1, 0, 0, 0,   0, Prand([0, 1]), 1, 0, // beat 1
		1, 0, 0, Prand([0, 1]),   0, 0, 1, 0,// beat 2
		1, 0, 0, 0,   0, 0, 1, 0,// beat 3
		1, 0, 0, 0,   1, 0, 1, 1,// beat 4
	], inf) * 0.75,
).play(~clock, quant: 4).quant = 4;

// adding one more player (\p3):
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, 0.81,
	\startPos, 0.39,
	\att, 0.001,
	\rel, 2,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;

// and one more (\p4)
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1947A'),
	\dur, 2,
	\rate, Pseq([
		0.66, 0.66, 0.66, 0.66,
		0.88, 0.88, 0.66, 0.66,
		1.0, 0.88, 0.66, 0.66
	], inf),
	\startPos, 0.04,
	\att, 0.001,
	\rel, 5,
	\amp, 0.7,
).play(~clock, quant: 4).quant = 4;

// adding some horns:
Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2016A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.5,
	\att, 0.001,
	\rel, 5,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 0,// beat 2
		0, 0, 0, 0,   1, 0, 0, 0,// beat 3
		0, 0, 0, 0,   0, 0, 0, 0,// beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;



