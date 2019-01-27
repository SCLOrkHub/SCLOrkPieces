// ==================================
// Preset: Edmond-1
// Number of voices: 7
// Most recent year sampled: 1924
// Comments:
// ==================================

// Clarinet Ascent
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 4,
	\rate, 1.25,
	\startPos, 0.10,
	\att, 1.00,
	\rel, 2.50,
	\amp, 1.0
).play(~clock, quant: 4).quant = 4;


// Two Note Tuba Descent
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, 0.25,
	\startPos, 0.10,
	\att, 0.50,
	\rel, 0.50,
	\amp, Pseq([
		0, 0, 0, 0,    0, 0, 0.00, 0, // beat 1
		0, 1, 0, 0,    0, 0, 0.00, 0, // beat 2
		0, 0, 0, 0,    1, 0, 0.00, 0, // beat 3
		0, 0, 0, 0,    0, 0, 0.00, 0 // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

// Iron Lung Like Rumble
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, 0.15,
	\startPos, 0.1,
	\att, 2.00,
	\rel, 2.00,
	\amp, Pseq([
		1, 0, 0, 0,    0, 0, 0, 0, // beat 1
		0, 0, 0, 0,    0, 0, 0, 0, // beat 2
		0, 0, 0, 0,    0, 0, 0, 0, // beat 3
		0, 0, 0, 0,    0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// Lower Bass Rumble
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, -0.05,
	\startPos, 0.10,
	\att, 1.00,
	\rel, 1.40,
	\amp, Pseq([
		0, 0, 0, 0,    0, 0, 0, 0, // beat 1
		0, 0.25, 0, 0,    0, 0, 0, 0, // beat 2
		0, 0, 0, 0,    0.25, 0, 0, 0, // beat 3
		0, 0, 0, 0,    0, 0, 0, 0  // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// Wahwah
Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, 0.30,
	\startPos, 0.50,
	\att, 0.50,
	\rel, 1.50,
	\amp, Pseq([
		0, 0.15, 0, 0,    0, 0, 0.00, 0, // beat 1
		0, 0, 0, 0,    0, 0, 0.00, 0, // beat 2
		0, 0, 0, 0,    0, 0.15, 0.00, 0, // beat 3
		0, 0, 0, 0.15,    0, 0, 0.00, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// Reverse Trill-Chirp
Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, -1.0,
	\startPos, 0.50,
	\att, 0.50,
	\rel, 0.50,
	\amp, Pseq([
		0, 0, 0, 1,    0, 0, 0.00, 0, // beat 1
		0, 0, 0, 0,    0, 0, 0.00, 0, // beat 2
		0, 0, 0, 0,    0, 1, 0.00, 0, // beat 3
		0, 0, 0, 0,    0, 0, 0.00, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// Record Squeak-Scratch
Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.80,
	\att, 0.10,
	\rel, 0.10,
	\amp, Pseq([
		0.15, 0, 0, 0,    0, 0, 0.00, 0, // beat 1
		0, 0, 0, 0,    0.25, 0, 0.00, 0, // beat 2
		0, 0, 0.05, 0,    0, 0, 0.00, 0, // beat 3
		0, 0, 0, 0,    0, 0, 0.5, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
