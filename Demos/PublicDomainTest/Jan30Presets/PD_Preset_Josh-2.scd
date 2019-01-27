// ==================================
// Preset: Josh-2
// Number of voices: 6
// Most recent year sampled: 1994
// Comments:
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1994A'),
	\dur, 1/4,
	\rate, Pseq([Pn(1, 16), Pn(2/3, 16)], inf) * 1.02,
	\startPos, 0,
	\att, 0.01,
	\rel, Pwhite(0.51, 0.63, inf),
	\amp, Pseq([
		1, 0, 0, 1,
		0, 1, 0, 0,
		1, 0, 0, 0,
		0, 0, 0, 0,
		1, 0, 0, 1,
		0, 1, 0, 0,
		1, 0, 0, 0,
		0, 0, 0, 0
	], inf) * 1.6
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1947B'),
	\dur, 1/4,
	\rate, Pseq([-1, 1], inf),
	\startPos, 0.901,
	\att, 0.01,
	\rel, Pseq([4, 5], inf),
	\amp, Pseq([
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 1, 1.2, 0,
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 0, 0
	], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1958A'),
	\dur, 1/4,
	\rate, Pseq([Pn(1/2, 16), Pn(1/3, 16)], inf) * 0.9,
	\startPos, 0.601,
	\att, 0.01,
	\rel, 2,
	\amp, Pseq([0.7, 0, 0, 0, 0, 0.7, 0, 0, 0, 0, 0.7, 0, 0.7, 0, 0.7, 0, 0.7, 0, 0, 0, 0, 0.7, 0, 0, 0, 0, 0.7, 0, 0.7, 0, 0.7, 0], inf) * 1.1
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1923B'),
	\dur, 1/32,
	\rate, Prand([-1/2, -2, -4/3, -2/3, -1, 1, 1/2, 2, 4/3, 2/3], inf) * 1.2,
	\startPos, Pwhite(0, 0.9, inf),
	\att, 1,
	\rel, 2,
	\amp, Pwhite(0, 0.5, inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 1/2,
	\rate, Prand([-1/2, -1, -3/2], inf) * 0.8,
	\startPos, 0.1,
	\att, 0.02,
	\rel, 3.5,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1], inf) * 2
).play(~clock, quant: 4).quant = 4;

Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987A'),
	\dur, 1/4,
	\rate, 0.754,
	\startPos, 0.14,
	\att, 0.01,
	\rel, 1.5,
	\amp, Pseq([0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0], inf) * 1.5
).play(~clock, quant: 4).quant = 4;



