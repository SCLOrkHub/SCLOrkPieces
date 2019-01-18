// ==================================
// Preset: Kaitlin-4
// Number of voices: 7
// Most recent year sampled: 1940
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 4,
	\rate, 0.9, // THIS IS COOL
	\startPos, 0.7, //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, 0.8, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Prand([0.69, 0.7, 0.87], inf), //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 4,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1/3, 1/2, 1, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, Pseq([1.6,1.7,1.8,1.9], inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.87, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 5,
	\amp, Pseq([
		1/9, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.7, //Pseq([0.2, 0.199], inf),
	\att, 1,
	\rel, 4,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 1/9, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.7, //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, Pseq([15,1],inf),
	\amp, Pseq([
		0, 1, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1/9, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 0.5,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, 0.95,
	\startPos, 0.7, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Pseq([15,1],inf),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1/9, 0, // beat 4
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1.0, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.7,
	\att, 0.01,
	\rel, Pseq([15,1],inf),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;