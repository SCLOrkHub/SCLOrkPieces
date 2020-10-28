// ==================================
// Preset: Spencer-1
// Number of voices: 2
// Most recent year sampled: 1960
// Comments: My first preset, only used two voices because there is a lot going on. I thought the mix fit well and didn't want to change it.
// ==================================


Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1960A'),
	\dur, 4,
	\rate, 120/124,
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 1
).play(~clock, quant: 4).quant = 4;



Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1951A'),
	\dur, 8,
	\rate, 120/124,
	\startPos, 0.62, //Pseq([0.2, 0.199], inf),
	\att, 0.05,
	\rel, 10.5, //Pwhite(0.9, 3),
	\amp, Pseq([1, 0, 1, 0], inf), // beat], inf)
).play(~clock, quant: 4).quant = 4;
