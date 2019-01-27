// ===========================
// Preset: Tanya
// Number of voices: 3
// Most recent voice sampled: 1939
// Comments:
// ===========================


Pbindef(\p1, //hit & trumpet
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 1/8,
	\rate, 0.98,
	\startPos, 0.7,
	\att, 0.001,
	\rel, 1.5,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2, //bell tings, doo doooo
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1939A'),
	\dur, 1/8,
	\rate, 1.01,
	\startPos, 0.5,
	\att, 0.001,
	\rel, Pwhite(0.5, 1.1),
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 1, 0, // beat 1
		1, 0, 0, 0, 0, 0, 1, 0,// beat 2
		1, 0, 0, 0, 0, 0, 1, 0,// beat 3
		1, 0, 0, 0, 1, 0, 1, 1,// beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;



Pbindef(\p3, // low bass, percussive sound
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1935A'),
	\dur, 1/8,
	\rate, 0.81,
	\startPos, 0.11,
	\att, 0.001,
	\rel, 2,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 2,
).play(~clock, quant: 4).quant = 4;