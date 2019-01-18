// ==================================
// Preset: Kaitlin-1
// Number of voices: 7
// Most recent year sampled: 1962
// Comments:
// ==================================

// sci-fi trill echo-y
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1924A'),
	\dur, 1/8,
	\rate, 1/2, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 2,
	\amp, Pseq([
		1/4, 1/3, 1/2, 1,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1/8, 1/7, 1/6, 1/5, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

// low, thick, ambient background, some rhythm
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 1/8,
	\rate, 0.25, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.9, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 10,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// main singing, recognizable we'll meet again lyrics
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1939A'),
	\dur, 1/8,
	\rate, 1.08, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Prand([0.8,2,0.3],inf),//Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 10,
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 0.5,
).play(~clock, quant: 4).quant = 4;


// ambient, harmonic layer, spacey, continuous
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1958A'),
	\dur, 1/8,
	\rate, 0.2, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.7, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 10,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		1/7, 1/6, 1/5, 1/4,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// harmonic, low pitch vocal thing, rhythmic
Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1935A'),
	\dur, 1/8,
	\rate, 0.5,//Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.5,0.9], inf), //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 1,
	\amp, Pseq([
		0, 0, 0, 0,   1, 1, 1, 1, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;




// very very very quiet low blob once every bar
Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1962A'),
	\dur, 1/8,
	\rate, 0.3, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.7, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 1/4,   0, 0, 0, 0, // beat 4
	], inf)
).play(~clock, quant: 4).quant = 4;


// low hit, off beat 4
Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1935A'),
	\dur, 1/8,
	\rate, 0.5,
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 1, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


// quiet orchestral brass section progression
Pbindef(\p8,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1955A'),
	\dur, 1/8,
	\rate, 0.5, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 10,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 1/9, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
