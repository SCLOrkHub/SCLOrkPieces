// ==================================
// Preset: Kaitlin-7
// Number of voices: 4
// Most recent year sampled: 1972
// Comments: ROBERTA FLACK- First Time Ever I Saw Your Face
// ==================================



Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1972A'),
	\dur, 32,
	\rate, 1/2,
	\startPos, 10/35, //other suggestions:  3/35   8/35
	\att, 0.5,
	\rel, 100, //
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,                               //Percussion 1
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1972A'),
	\dur, 1/8,
	\rate, Pseq([0.7, 0.5, 0.7, 0.5], inf), //0.9 * Pwrand([0.7, 6/5], [0.5, 0.1], inf),
	\startPos, Pseq([0.4, 0.43], inf), //0.4,
	\att, 0.1,
	\rel, Prand([4, 14], inf),
	\amp, Pseq([
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 0.5, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 0.5, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1972A'),
	\dur, 1/16,
	\rate, 0.5,
	\startPos, 0.4,
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
	\bufnum, ~mySamples.at('1972A'),
	\dur, 1/2, //Prand([1/4, Rest(1/4)], inf),
	\rate, 0.7,
	\startPos, Prand([29/35, 17/35, 15/35, 23/45], inf), //17/35,
	\att, 0.5,
	\rel, 60,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
