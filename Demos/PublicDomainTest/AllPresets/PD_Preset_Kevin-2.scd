// ==================================
// Preset: Kevin-2
// Number of voices: 8
// Most recent year sampled: 1987
// Comments:
// ==================================

Pbindef(\p1,                              //Newman - Less than Zero
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 4,
	\rate, 1/2,
	\startPos, Pseq([0.7, 0.81], inf),
	\att, 0.01,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8,
	\rate, 0.5 * Pwrand([1, 6/5], [0.9, 0.1], inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.4, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Prand([4, 14], inf) * 1,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8,
	\rate, Pseq([0.2, 0.5, 0.2, 0.5], inf),
	\startPos, Pseq([0.7, 0.4, 0.3], inf), //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 10, //Pwhite(3, 14),
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 1, 0,   0, 0, 1, 0, // beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;



Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, Pseq([1, 0.5, 0.25, 0.5], inf),
	\startPos, Pseq([0.4, 0.5, 0.6, 0.7], inf),
	\att, 0.1,
	\rel, Pwhite(4, 18),
	\amp, Pseq([
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0.5, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0.5, 0.5, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,                             //Police - Every Breath You Take
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\dur, 1/8,
	\rate, Pseq([0.5, 0.75, 0.5, 0.5], inf),
	\startPos, Pseq([0.2, 0.1], inf),
	\att, 0.1,
	\rel, 4,
	\amp, Pseq([
		0.25, 0, 0, 0,   0, 0.25, 0, 0, // beat 1
		0, 0, 0.25, 0,   0, 0, 0, 0.25, // beat 2
		0, 0, 0.25, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\rate, Pseq([0.71, 0.5, 0.72, 0.5], inf),
	\startPos, Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 6,
	\amp, Pseq([
		0, 0.4, 0, 0.6,   0, 0.5, 0, 0.6, // beat 1
		0, 0, 0.3, 0,   0, 0, 0.2, 0, // beat 2
		0, 0.1, 0, 0,   0, 0.4, 0, 0, // beat 3
		0.5, 0.6, 0, 0,   0, 0, 0.8, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\dur, 1/8,
	\rate, Pseq([0.75, 0.5, 0.75, 0.5], inf),
	\startPos, Pn(Pseries(0, 0.1, 10), inf), //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 6,
	\amp, Pseq([
		0, 1, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 0.5,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p8,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\dur, 1/8,
	\rate, Pseq([0.75, 0.5, 0.75, 0.5], inf),
	\startPos, Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 12,
	\amp, Pseq([
		0, 0.5, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0.5, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
