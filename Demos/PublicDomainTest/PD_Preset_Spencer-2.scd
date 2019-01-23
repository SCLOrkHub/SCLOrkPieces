// ==================================
// Preset: Spencer-2
// Number of voices: 4
// Most recent year sampled: 1995
// Comments: Took careless whisper and tried to add in percussion and vocal slices. Slight tempo issues but pretty much what I want.
// ==================================

(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1995A'),
	\dur, 4/8,
	\rate, 0.98, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.023,
	\att, 0.001,
	\rel, 1,
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
	\dur, 4,
	\rate, 0.76, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.17,
	\att, 0.01,
	\rel, 8,
	\amp, 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1982A'),
	\dur, 4,
	\rate, 0.5, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.59,
	\att, 0.1,
	\rel, 1,
	\amp, 1,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1993A'),
	\dur, 4,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.5,
	\att, 0.1,
	\rel, 4,
	\amp, 1,
).play(~clock, quant: 4).quant = 4;
)



