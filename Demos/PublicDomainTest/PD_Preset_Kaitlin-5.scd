// ==================================
// Preset: Kaitlin-5
// Number of voices: 7
// Most recent year sampled: 1935
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1935A'),
	\dur, 3,
	\rate, 0.1,
	\startPos, 0.5, //Pseq([0.2, 0.199], inf),
	\att, 5,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 3,
	\rate, Pseq([0.1,0.4,0.6,0.8], inf),
	\startPos, 0.5,
	\att, 5,
	\rel, 10,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		1, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 2.5,
).play(~clock, quant: 4).quant = 4;




Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 1,
	\rate, 10, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 10,
	\rel, 2,
	\amp, Pseq([
		0, 0, 0, 0,   3, 4, 5, 6, // beat 1
		0, 0, 0, 0,   0, 4, 0, 0, // beat 2
		0, 0, 0, 0,   0, 4, 5, 6, // beat 3
		0, 0, 0, 0,   0, 4, 5, 6, // beat 4
	], inf)*0.154,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 1,
	\rate, 2, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 0.2,
	\rel, 0.5,
	\amp, Pseq([
		0, 0, 0, 0,   0, 2, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 2, 0, // beat 2
		2, 0, 0, 1/2,   1, 0, 0, 2, // beat 3
		0, 0, 0, 1/2,   0, 2, 0, 0, // beat 4
	], inf)*0.5,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 4/8,
	\rate, 7, // THIS IS COOL
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 1,
	\rel, 2, //Pwhite(0.9, 3),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 1, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 1, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf)*0.3,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 0.5,
	\rate, 6, // THIS IS COOL
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 1,
	\rel, 5, //Pwhite(0.9, 3),
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   1, 2, 3, 4,
        0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0 ,0,
	], inf)*0.21,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1921A'),
	\dur, 2,
	\rate, 5, // THIS IS COOL
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 10,
	\rel, 0.5, //Pwhite(0.9, 3),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		1/8, 1/7, 1/6, 1/5,   1/4, 1/3, 1/2, 1, // beat 4
	], inf)*0.3,
).play(~clock, quant: 4).quant = 4;
