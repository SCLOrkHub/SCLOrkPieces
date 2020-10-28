// ==================================
// Preset: Kevin-6
// Number of voices: 4
// Most recent year sampled: 1925
// Comments: Saint Saens - Danse Macabre (1925)
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 32,
	\rate, 2/3,
	\startPos, 1.5/52.14,
	\att, 0.5,
	\rel, 100, //
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 1/8,
	\rate, 1/3,
	\startPos, 1.5/52.14,
	\att, 0.1,
	\rel, Prand([4, 14], inf) * 1,
	\amp, Pseq([
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 0.5, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 0.5, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 1/16,
	\rate, 1/6,
	\startPos, 1.5/52.14,
	\att, 0.1,
	\rel, 5, //Pwhite(3, 14),
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 0, 0, // beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;



Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 1/2, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1/6,
	\startPos, 35.5/52.14, //17/35,
	\att, 0.5,
	\rel, 60,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
