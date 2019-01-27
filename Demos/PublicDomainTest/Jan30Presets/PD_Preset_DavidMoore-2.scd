// ==================================
// Preset: DavidMoore-2
// Number of voices: 5
// Most recent year sampled: 2003
// Comments:
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/4,
	\rate, 0.8,
	\startPos, 0.035,
	\att, 0.01,
	\rel, 0.4,
	\amp, Pseq([
		0, 1, 0, 1,   0, 1, 0, 1, // beat 1
		0, 1, 0, 1,   0, 1, 0, 1, // beat 2
		0, 1, 0, 1,   0, 1, 0, 1, // beat 3
		0, 1, 0, 1,   0, 1, 0, 1, // beat 4
	], inf) * 1.5,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1935A'),
	\dur, 1/4,
	\rate, 0.85,
	\startPos, Pseq([0.851],inf),
	\att, 0.01,
	\rel, 0.7,
	\amp, Pseq([
		1, 0, 0, 0,   1, 0, 0, 0, // beat 1
		1, 0, 0, 0,   1, 0, 0, 0, // beat 2
		1, 0, 0, 0,   1, 0, 0, 0, // beat 3
		1, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 1.5,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 1/2,
	\rate, Pseq([1.01,0.1,0.8,0.1],inf),
	\startPos, Pseq([0.038,0.1,0.183,0.1],inf),
	\att, 0.01,
	\rel, Pseq([8,1,3,1],inf),
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 1/4,
	\rate, Pseq([1.01],inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,  0, 0, 0, 0, // beat 2
		0.038, 0.039, 0.041, 0.042,   0.043, 0.044, 0.045, 0.046, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),  //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, Pseq([1],inf),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,  0, 0, 0, 0, // beat 2
		1, 0, 1, 1,   0, 1, 1, 1, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1.3,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1939A'),
	\dur, 1/2,
	\rate, 1,
	\rel, 4,
	\amp, Pseq([ // YOU HAVE THE VOICE -- ADD MORE OF IT HERE
		0, 0, 0, 0,   0, 1, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 1, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 2,
	\startPos, Pseq([
		0.27, 0.25, 0.25, 0.5,   0.2, 0.27, 0.4, 0.4, // beat 1
		0.1, 0.2, 0.3, 0.4,   0.5, 0.6, 0.7, 0.5, // beat 2
		0.39, 0.39, 0, 0.39,   0, 0.39, 0, 0.39, // beat 3
		0.3, 0.5, 0.7, 0.2,   0.1, 0.2, 0.32, 0.4, // beat 4
	], inf),
	\att, 0.02,
	\crv, 3
).play(~clock, quant: 4).quant = 4;