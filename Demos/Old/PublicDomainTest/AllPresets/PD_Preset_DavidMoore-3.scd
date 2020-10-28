// ==================================
// Preset: DavidMoore-3
// Number of voices: 5
// Most recent year sampled: 2016
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1996A'),
	\dur, 4/8,
	\rate, 0.98, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.023,
	\att, 0.001,
	\rel, 1 ,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 1, 0, // beat 1
		0, 0, 0, 0,  0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 1, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 4/8,
	\rate, 1.01, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.0092,0.017,0.01,0.1],inf),
	\att, 0.001,
	\rel, 1.1,
	\amp, Pseq([
		1, 0, 1, 0,   1, 0, 1, 0, // beat 1
		1, 0, 1, 0,  1, 0, 1, 0,// beat 2
		1, 0, 1, 0,  1, 0, 1, 0,// beat 3
		1, 0, 1, 0,    1, 0, 1, 0,// beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1947A'),
	\dur, 4/8,
	\rate, Pseq([0.66,1,1,1,0.88,1,1,1],inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.04,0.01,0.01,0.04],inf),
	\att, 0.001,
	\rel, 5,
	\amp, Pseq([
		1, 0, 0, 0,   1, 0, 0, 0, // beat 1
		1, 0, 0, 0,  1, 0, 0, 0,// beat 2
		1, 0, 0, 0,  1, 0, 0, 0,// beat 3
		1, 0, 0, 0,    1, 0, 0, 0,// beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2016A'),
	\dur, 4/8,
	\rate, Pseq([1],inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.5],inf),
	\att, 0.001,
	\rel, 5,
	\amp, Pseq([
		0, 0, 1, 0,   0, 1, 0, 0, // beat 1
		0, 0, 1, 0,  0, 1, 0, 0,// beat 2
		0, 0, 1, 0,  0, 1, 0, 0,// beat 3
		0, 0, 1, 0,    0, 1, 0, 0,// beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;




