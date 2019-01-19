// ==================================
// Preset: Bruno-6
// Number of voices: 4
// Most recent year sampled: 2004
// Comments: derived from Josh-2
// ==================================


Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 8,
	\rate, 103/120,
	\startPos, 0.1369,
	\att, 0.1,
	\rel, 0.2,
	\legato, 1,
	\amp, 1
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/4,
	\rate, Prand([1, -1], inf), //Pseq([Pn(1, 16), Pn(2/3, 16)], inf) * 1.02,
	\startPos, 0.78, //Pseq(Array.series(32, 0, 1).normalize, inf),
	\att, 0.01,
	\rel, 0.1,
	\legato, 0.25,
	\amp, Pseq([
		1, 0, 0, 0,
		1, 0, 1, 0,
		1, 0, 0, 0,
		0, 0, 0, 0,
	], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.401,
	\att, 0.01,
	\rel, 0.3,
	\legato, 0.3,
	\amp, Pseq([
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 0,
		0, 0, 1, 0,
		0, 0, 1, 0,
		0, 1, 1, 0,
		0, 0, 1, 0
	], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2002A'),
	\dur, 1/8,
	\rate, Pseq([Pn(1/2, 16), Pn(1/3, 16)], inf) * 0.9,
	\startPos, 0.601,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([
		0.7, 0, 0, 0, 0, 0.7, 0, 0,
		0, 0, 0.7, 0, 0.7, 0, 0.7, 0,
		0.7, 0, 0, 0, 0, 0.7, 0, 0,
		0, 0, 0.7, 0, 0.7, 0, 0.7, 0
	], inf) * 1.1
).play(~clock, quant: 4).quant = 4;




