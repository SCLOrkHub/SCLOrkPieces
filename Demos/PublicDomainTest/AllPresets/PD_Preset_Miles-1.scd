// ==================================
// Preset: Miles-1
// Number of voices: 4
// Most recent year sampled: 2004
// Comments:
// ==================================

//Usher's YEAH!
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, (60/105)*1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.45,
	\att, 0.01,
	\rel, 6,
	\crv, 4,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf)/2,
).play(~clock, quant: 4).quant = 4;

//Hi hat
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 5,
	\startPos, 0.3085,
	\att, 0.01,
	\rel, 0.25,
	\amp, Pseq([
		1, 0, 1, 0,   1, 0, 1, 0, // beat 1
		1, 0, 1, 0,   1, 0, 1, 0, // beat 2
		1, 0, 1, 1,   1, 0, 1, 0, // beat 3
		1, 0, 1, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

//Clap
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1,
	\startPos, 0.3085,
	\att, 0.01,
	\rel, 0.5,
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0, // beat 1
		0, 0, 0, 0,   1, 0, 0, 0, // beat 2
		0, 0, 0, 0,   1, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

//The first row will always be 0.8 rate, second row 0.725, etc..
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2001A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, Pseq([
		Pseq([0.8], 8),
		Pseq([0.725], 8),
		Pseq([0.8], 8),
		Pseq([1.09], 8),
	], inf)*1,
	\startPos, 0.1,
	\att, 0.005,
	\rel, 0.3,
	\amp, Pseq([
		0, 1, 0, 0,   1, 0, 0, 1, // beat 1
		0, 0, 0, 0,   1, 0, 0, 0, // beat 2
		0, 1, 0, 0,   1, 0, 0, 1, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
