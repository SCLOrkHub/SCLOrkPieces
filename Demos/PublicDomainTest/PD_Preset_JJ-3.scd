// ==================================
// Preset: JJ-3
// Number of voices: 4
// Most recent year sampled: 1962
// Comments:
// ==================================

// Horn
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1962A'),
	\dur, 1/8,
	\rate, 0.5,
	\startPos, 0.02,
	\att, 0.01,
	\rel, 8,
	\amp, Pseq([
		0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0,
	], inf),
).play(~clock, quant: 4).quant = 4;

// Melody
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1962A'),
	\dur, 4,
	\rate, 1,
	\startPos, 0.0,
	\att, 0.2,
	\rel, 20,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


// Strings
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1962A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.712,
	\att, 0.1,
	\rel, 1.8,
	\amp, Pseq([
		0, 0, 0, 0,  0, 0, 0, 0,
		0, 0, 0, 0,  1, 0, 0, 0,
		0, 0, 0, 0,  0, 0, 0, 0,
		0, 0, 0, 0,  0, 0, 0, 0,
	], inf),
).play(~clock, quant: 4).quant = 4;


// Bass Drum Synth
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1962A'),
	\dur, 2,
	\rate, Prand([
		0.7, 0.8, 0.9], inf),
	\startPos, 0.05,
	\att, 0.05,
	\rel, 4,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


