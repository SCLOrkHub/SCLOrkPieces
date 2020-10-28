// ==================================
// Preset: Sophia-2
// Number of voices: 5
// Most recent year sampled: 2002
// Comments:
// ==================================


Pbindef(\p1, // "you remind me" \p1
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2002A'),
	\dur, 1/8,
	\rate, 2,
	\startPos, 0.14,
	\att, 0.001,
	\rel, 1.4,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;



Pbindef(\p2, // synth drum vibes \p2
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2002A'),
	\dur, 1/4,
	\rate, 2,
	\startPos, 0.185,
	\att, 0.001,
	\rel, Pwhite(0.5, 1.1),
	\amp, Pseq([
		1, 0, 1, 0, 1, 0, 1, 0, // beat 1
		1, 0, 1, 0, 1, 0, 1, 0,// beat 2
		1, 0, 1, 0, 1, 0, 1, 0,// beat 3
		1, 0, 1, 0, 1, 0, 1, 1,// beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3, // soft scratch (\p3):
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2002A'),
	\dur, 1/8,
	\rate, 2,
	\startPos, 0.99,
	\att, 3,
	\rel, 5,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;



Pbindef(\p4, // "sense of feeling" (\p4)
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2002A'),
	\dur, 2,
	\rate, Pseq([
		0.66, 0.66, 0.66, 0.66,
		0.88, 0.88, 0.66, 0.66,
		1.0, 0.88, 0.66, 0.66
	], inf),
	\startPos, 0.04,
	\att, 0.001,
	\rel, 4,
	\amp, 0.7,
).play(~clock, quant: 4).quant = 4;



Pbindef(\p5, // melty global dance festival (\p5)
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2002A'),
	\dur, 1/8,
	\rate, -1.6,
	\startPos, 0.42,
	\att, 0.001,
	\rel, 5,
	\amp, Pseq([
		0, 0.5, 0, 0, 0.5, 0, 0, 0.5, // beat 1
		0, 0, 0, 0.5, 0, 0.5, 0, 0,// beat 2
		0, 0, 0, 0, 0.5, 0, 0, 0,// beat 3
	0.5, 0, 0, 0, 0, 0, 0, 0.5,// beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;