// ==================================
// Preset: Bruno-6
// Number of voices: 4
// Most recent year sampled: 2004
// Comments: Come get me
// Derived from Josh-2
// ==================================


Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 8,
	\rate, 103/120,
	\startPos, 0.1369,
	\att, 0.1,
	\rel, 0.01,
	\legato, 1,
	\amp, 1
).play(~clock, quant: 8).quant = 8;

Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/6,
	\rate, Pseq([Pn(-0.85, 44), Pn(-1.02, 4)], inf),
	\startPos, 0.778,
	\att, 0.01,
	\rel, 0.1,
	\legato, 0.45,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 1, 0,   0, 1, 0, 0,   1, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 1, 0,   0, 0, 0, 0,   0, 0, 0, 0,
		1, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 1, 0, 0,
	], inf) * 3
).play(~clock, quant: 8).quant = 8;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/6,
	\rate, 1,
	\startPos, 0.401,
	\att, 0.01,
	\rel, 0.3,
	\legato, 0.7,
	\amp, Pseq([
		1, 0, 1, 0,  0, 0, 1, 0,  0, 0, 0, 0, 1, 0, 0, 0,
		0, 0, 1, 0,  0, 0, 0, 0, 1, 0, 0, 0,  0, 0, 1, 0,
		0, 0, 0, 0, 1, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
	], inf) * 3
).play(~clock, quant: 8).quant = 8;


Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/6,
	\rate, 2,
	\startPos, 0.401,
	\att, 0.01,
	\rel, 0.1,
	\legato, 0.5,
	\amp, Pseq([
		1, 1, 0, 1,  0, 0, 1, 0,  0, 0, 0, 0,  1, 1, 0, 1,
		0, 0, 1, 0,  0, 0, 0, 0,  1, 1, 0, 1,  0, 0, 1, 0,
		0, 0, 1, 0,  0, 0, 1, 0,  0, 0, 1, 0,  0, 0, 1, 0
	], inf) * 2
).play(~clock, quant: 8).quant = 8;

