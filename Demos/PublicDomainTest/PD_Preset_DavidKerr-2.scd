// ==================================
// Preset: DavidKerr-2
// Number of voices: 4
// Most recent year sampled: 1985
// Comments: Voice 1 is ornamental in nature, Voices 2 and 3 are
//           essentially merged together to create the majority
//           of the loop's tonal structure, and  Voice 4 is a
//           wind-like background element.
//           ( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)
// ==================================


Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 1/8,
	\rate, [90], //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.15, //Pseq([0.2, 0.199], inf),
	\att, 0.7,
	\rel, 0.7,
	\amp, Pseq([
		0.05, 0.1, 0.1, 0.15,   0.2, 0.15, 0.1, 0.05, // beat 1
		0.025, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0.2, 0, 0.15, 0, // beat 3
		0.1, 0, 0.05, 0,   0.025, 0, 0.0125, 0, // beat 4
	], inf),
).play(~clock, quant: 8).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983C'),
	\dur, 1/8,
	\rate, [-1, -1.32], //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.5, //Pseq([0.2, 0.199], inf),
	\att, 2,
	\rel, 15,
	\amp, Pseq([
		4, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
		0, 0, 0, 0,   0, 0, 0, 0, // beat 5
		0, 0, 0, 0,   0, 0, 0, 0, // beat 6
		0, 0, 0, 0,   0, 0, 0, 0, // beat 7
		0, 0, 0, 0,   0, 0, 0, 0, // beat 8
	], inf),
).play(~clock, quant: 8).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983C'),
	\dur, 1/8,
	\rate, [1, 1.32], //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.5, //Pseq([0.2, 0.199], inf),
	\att, 1,
	\rel, 10,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
		0, 0, 0, 0,   8, 0, 0, 0, // beat 5
		0, 0, 0, 0,   0, 0, 0, 0, // beat 6
		0, 0, 0, 0,   0, 0, 0, 0, // beat 7
		0, 0, 0, 0,   0, 0, 0, 0, // beat 8
	], inf),
).play(~clock, quant: 8).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1964A'),
	\dur, 1/8,
	\rate, 0.2, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 1,
	\rel, 2,
	\amp, Pseq([
		4, 0, 0, 0,   3, 0, 0, 0, // beat 1
		3, 0, 0, 0,   2, 0, 0, 0, // beat 2
		2, 0, 0, 0,   1, 0, 0, 0, // beat 3
		1, 0, 0, 0,   0, 0, 0, 0, // beat 4
		0, 0, 0, 0,   2, 0, 0, 0, // beat 5
		1, 0, 2, 0,   6, 0, 0, 0, // beat 6
		6, 0, 0, 0,   5, 0, 0, 0, // beat 7
		5, 0, 0, 0,   4, 0, 0, 0, // beat 8
	], inf),
).play(~clock, quant: 8).quant = 4;