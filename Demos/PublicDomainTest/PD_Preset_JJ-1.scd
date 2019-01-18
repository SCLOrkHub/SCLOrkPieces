// ==================================
// Preset: JJ-1
// Number of voices: 7
// Most recent year sampled: 2008
// Comments:
// ==================================

// C'mon
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1,
	\rate, 0.6,
	\startPos, 0.45,
	\att, 0.01,
	\rel, 1,
	\amp, Pseq([
		1, 0, 1, 0], inf)
).play(~clock, quant: 4).quant = 4;

//Light beat
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1/4,
	\rate, 0.5,
	\startPos, 0.01,
	\att, 0.01,
	\rel, 0.25,
	\amp, Pseq([
		1, 0, 1, 0,
		1, 0, 1, 0,
		1, 0, 1, 0,
		1, 0, 1, 0
	]*0.5, inf),
).play(~clock, quant: 4).quant = 4;


//ting
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.3085,
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0,
		0, 0, 0, 0,   1, 0, 0, 1,
		0, 0, 0, 0,   1, 0, 0, 0,
		0, 0, 0, 0,   1, 0, 0, 1,
	], inf),
).play(~clock, quant: 4).quant = 4;

//voice interjection
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.1,
	\att, 0.005,
	\rel, 0.3,
	\amp, Pseq([
		0, 1, 0, 0,   1, 0, 0, 0,
		0, 0, 0, 0,   1, 0, 0, 0,
		0, 1, 0, 0,   1, 0, 0, 0,
		0, 0, 0, 0,   1, 0, 0, 0,
	], inf),
).play(~clock, quant: 4).quant = 4;

// uh
Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.46,
	\att, 0.005,
	\rel, 0.4,
	\amp, Pseq([
		0, 0, 0, 1,   0, 1, 0, 1,
		0, 0, 0, 1,   0, 0, 0, 0,
		0, 0, 0, 1,   0, 1, 0, 0,
		0, 0, 0, 1,   0, 0, 0, 1
	], inf),
).play(~clock, quant: 4).quant = 4;

// melodic progression??
Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1,
	\rate, 1,
	\startPos, 0.02,
	\att, 1,
	\rel, 2,
	\amp, Pseq([1, 0, 0, 0], inf)
).play(~clock, quant: 4).quant = 4;

//melodic progression part 2?
Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2008A'),
	\dur, 1,
	\rate, 1,
	\startPos, 0.44,
	\att, 0.5,
	\rel, 2,
	\amp, Pseq([0, 0, 1, 0], inf)
).play(~clock, quant: 4).quant = 4;