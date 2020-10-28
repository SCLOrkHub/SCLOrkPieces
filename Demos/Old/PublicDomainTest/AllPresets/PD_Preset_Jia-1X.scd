// ==================================
// Preset: Jia-1X
// Number of voices: 3
// Most recent year sampled: 2004
// Comments: modified by Bruno to fit 2004 bucket
// ==================================

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/8, // 4 beats
	\rate, 1,
	\startPos, Pseq([0.3, 0.45, 0.66, 0.8], inf),
	\att, Prand([0.1, 0.5], inf),
	\rel, Pwhite(0.1, 0.5),
	\amp, Prand([0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 1/2,
	\rate, 1,
	\startPos, Pseq([0.2, 0.55, 0.2, 0.9], inf),
	\att, Pseq([0.7, 0.25, 0.5, 0.75], inf),
	\rel, Pseq([0.5, 0.4, 0.5, 0.25], inf) * 0.5,
	\amp, Pseq([0.9, 0.75, 0.5, 0.1], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/8,
	\rate, 1.5,
	\startPos, 0.06,
	\att, 0.1,
	\rel, Prand([0.1, 0.41], inf),
	\amp, Pseq([0.25, 0.5, 0.75, 0], inf)
).play(~clock, quant: 4).quant = 4;