// ==================================
// Preset: Henry-2
// Number of voices: 5
// Most recent year sampled: 2015
// Comments:
// ==================================


(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2014A'),
	\dur, 1/8,
	\rate, 0.98,
	\startPos, 0.023,
	\att, 0.001,
	\rel, 1,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 1/8,
	\rate, 0.7,
	\startPos, 0.01,
	\att, 0.001,
	\rel, 1,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0,// beat 2
		0, 0, 0, 0, 0, 0, 0, 0,// beat 3
		0, 0, 0, 0, 0, 0, 0, 0,// beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1923A'),
	\dur, 1/8,
	\rate, 0.81,
	\startPos, 0.39,
	\att, 0.001,
	\rel, 2,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		0, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 4,
	\rate,  Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		1, 0, 0, 0, 0, 0, 0, 0,// beat 2
		1, 0, 0, 0, 0, 0, 0, 0,// beat 3
		1, 0, 0, 0, 0, 0, 0, 0,// beat 4
	], inf) * 0.8,
	\startPos, 0.4,
	\att, 0.001,
	\rel, 5,
	\amp, 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2015A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.65,
	\att, 0.001,
	\rel, 0.5,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		1, 0, 0, 0, 0, 0, 0, 0,// beat 2
		1, 0, 0, 0, 0, 0, 0, 0,// beat 3
		1, 0, 0, 0, 0, 0, 0, 0,// beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;
)