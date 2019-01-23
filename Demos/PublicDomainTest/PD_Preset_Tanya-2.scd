// ===========================
// Preset: Tanya
// Number of voices: 3
// Most recent voice sampled: 1939
// Comments:
// ===========================

//hit & trumpet
Pbindef(\p1,
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
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;

//bell tings
Pbindef(\p2,
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
	], inf) * 0.4,
).play(~clock, quant: 4).quant = 4;


// low bass, percussive sound
Pbindef(\p3,
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
	], inf) * 1.5,
).play(~clock, quant: 4).quant = 4;

