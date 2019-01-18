// ==================================
// Preset: Kaitlin-3
// Number of voices: 5
// Most recent year sampled: 1946
// Comments: too weak to break the chains, prisoner of love
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 4,
	\rate, 1,
	\startPos, 0.6,
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 8,
	\rate, 0.5,
	\startPos, 0.6,
	\att, 0.1,
	\rel, 4,
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 8,
	\rate, 1,
	\startPos, 0.6,
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 8,
	\rate, 0.7,
	\startPos, 0.7,
	\att, 0.1,
	\rel, 15,
	\amp, Pseq([Pn(0, 12), Pseq([1, 0.9, 0.5, 0], inf)])
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 1,
	\rate, Pseq([0.2,0.5,0.9], inf),
	\startPos,0.7,
	\att, 2,
	\rel, 4,
	\amp, Pwhite(0.5, 0.8)
).play(~clock, quant: 4).quant = 4;
