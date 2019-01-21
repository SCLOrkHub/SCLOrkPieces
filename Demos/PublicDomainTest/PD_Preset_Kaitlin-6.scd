// ==================================
// Preset: Kaitlin-6
// Number of voices: 8
// Most recent year sampled: 1933
// Comments:
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 1,
	\startPos, 0.35,
	\att, 50,
	\rel, Pseq([25, 15, 25, 25], 5),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 1 * Pseries(1, 0.005, inf),
	\startPos, 0.39,
	\att, 50,
	\rel, Pseq([35, 15, 25, 35], 5),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 1 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.39 + Pseries(0, 0.05, 10),
	\att, 50,
	\rel, Pseq([15, 15, 25, 25], 5),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 1 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.45,
	\att, 50,
	\rel, Pseq([15, 15, 25, 25], 5),
	\amp, Pseq([Pn(0, 12), Pseq([1, 0.9, 0.5, 0], inf)])
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 1,
	\startPos, Pwhite(0.6, 0.9),
	\att, 50,
	\rel, Pseq([15, 15, 25, 25], 5),
	\amp, Pwhite(0.5, 0.8)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1/8,
	\rate, 0.8, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([
		0, 0, 3, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 0.8, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([
		0, 0, 0, 0,   3, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p8,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1933A'),
	\dur, 1,
	\rate, 0.8, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   3, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;