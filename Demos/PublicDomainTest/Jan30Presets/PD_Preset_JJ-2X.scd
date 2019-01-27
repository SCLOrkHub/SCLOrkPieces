// ==================================
// Preset: JJ-2
// Number of voices: 4
// Most recent year sampled: 2003
// Comments:
// ==================================

// First hit
Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.02,
	\att, 0.01,
	\rel, 2.1,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 1, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
	], inf) * 2,
).play(~clock, quant: 4).quant = 4;

//Clap
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/4,
	\rate, 1,
	\startPos, 0.263,
	\att, 0.01,
	\rel, 0.4,
	\amp, Pseq([
		0, 0, 1, 0,
		0, 0, 1, 0,
		0, 0, 1, 0,
		0, 0, 1, 0
	]*0.8, inf),
).play(~clock, quant: 4).quant = 4;


// orchestra hit with voice
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.932,
	\att, 0.01,
	\rel, 0.5,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 1, 0, 0, 0, 0,
		1, 0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 1, 0, 0, 0, 0,
	], inf),
).play(~clock, quant: 4).quant = 4;

// hi-hat
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.1,
	\att, 0.05,
	\rel, 0.1,
	\amp, Pseq([
		1,0,0,0, 1,0,0,0,
		1,0,0,0, 1,0,0,0,
		1,0,0,0, 1,0,0,0,
		1,1,1,1, 1,0,0,0,
	], inf) * 2,
).play(~clock, quant: 4).quant = 4;


