// ==================================
// Preset: Kevin-2
// Number of voices: 4
// Most recent year sampled: 1987
/* Comments: Thomas Newman - Less Than Zero (1987); Subwoofer recommended.
some points of interest
14.75/35    Reverberating wet drum hit
27.2/35     Multiple Reverberating wet drum hits
anywhere between 0/35 and 8/35 is classic gated reverb 80's drum hits *sounds great slowww*
*/
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 32,
	\rate, 1/2,
	\startPos, 17/35, //other suggestions:  10/35   8.5/35
	\att, 0.5,
	\rel, 100, //
	\amp, 1
).play(~clock, quant: 4).quant = 4;



Pbindef(\p2,                               //Percussion 1
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8,
	\rate, Pseq([0.7, 0.5, 0.7, 0.5], inf), //0.9 * Prand([0.7, 6/5], [0.5, 0.1], inf),
	\startPos, Pseq([0.4, 0.43], inf), //0.4,
	\att, 0.1,
	\rel, Prand([4, 14], inf) * 1,
	\amp, Pseq([
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 0.5, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 0.5, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,                                //Percussion 2
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
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



Pbindef(\p4,                                //Strings
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/2, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1/2,
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
