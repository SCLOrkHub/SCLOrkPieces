// ==================================
// Preset: Henry-3
// Number of voices: 1
// Most recent year sampled: 1951
// Comments: everybody starts unison then drift apart by live coding
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1951A'),
	\dur, 1/8,
	\rate, 0.5,
	\startPos, 0.0331,
	\att, 1,
	\rel, 10,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		0, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;