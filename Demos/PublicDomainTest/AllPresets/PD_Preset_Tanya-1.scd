// ===========================
// Preset: Tanya-1
// Number of voices: 4
// Most recent voice sampled: 1979
// Comments: Inspired by Harley Quinn (violent but comic)
// ===========================

//loud knocking
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 1/8,
	\rate, 0.98,
	\startPos, 0.3,
	\att, 0.001,
	\rel, 1,
	\amp, Pseq([
		1, 0, 1, 0, 1, 0, 1, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 1, 0, 1, 0, 1, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;


// fast paced tempo, violent even lmao
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 1/12,
	\rate, 1.01,
	\startPos, 0.01,
	\att, 0.001,
	\rel, Pwhite(0.5, 1.1),
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 1, 0, // beat 1
		1, 0, 0, 0, 0, 0, 1, 0,// beat 2
		1, 0, 0, 0, 0, 0, 1, 0,// beat 3
		1, 0, 0, 0, 1, 0, 1, 1,// beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


//machine gun shots
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1979A'),
	\dur, 1/8,
	\rate, 0.81,
	\startPos, 0.39,
	\att, 0.001,
	\rel, 2,
	\amp, Pseq([
		0, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 1, 1, 1, 1, 1, 1, 1, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 0.75,
).play(~clock, quant: 4).quant = 4;



// slow paced chords for contrast
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1947A'),
	\dur, 2,
	\rate, Pseq([
		0.66, 0.66, 0.66, 0.66,
		0.88, 0.88, 0.66, 0.66,
		1.0, 0.88, 0.66, 0.66
	], inf),
	\startPos, 0.09,
	\att, 0.001,
	\rel, 5,
	\amp, 0.7,
).play(~clock, quant: 4).quant = 4;

