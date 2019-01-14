// ===============
// COMPOSE!
// Here are a bunch of Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============



// ================
// PRESET David-1
// ================


(
~gamp=4;

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4,
	\rate, 0.5, // THIS IS COOL
	\startPos, 0.445, //Pseq([0.2, 0.199], inf),
	\att, 0.05,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 0.5*~gamp
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2011A'),
	\dur, 2/8,
	\rate, 0.7, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.0026, //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 1,
	\amp, Pseq([
		1, 0, 0, 0,   1, 0, 0, 0, // beat 1
		1, 0, 0, 0,   1, 0, 0, 0, // beat 2
		1, 0, 0, 0,   1, 0, 0, 0, // beat 3
		1, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 2.5*~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2017A'),
	\dur, 1/8,
	\rate, 0.73, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.001,0.05,0.05,0.001],inf), //Pseq([0.2, 0.199], inf),
	\att, 0.02,
	\rel, 0.1,
	\amp, Pseq([
		1, 0, 1, 0,   0, 1, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 0, 1, 0,   0, 1, 0, 0, // beat 3
		1, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf)*0.154*~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4/8,
	\rate, 0.67, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.85, //Pseq([0.2, 0.199], inf),
	\att, 0.03,
	\rel, 2,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 1, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 1, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf)*0.5*~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4/8,
	\rate, 0.50, // THIS IS COOL
	\startPos, 0.1, //Pseq([0.2, 0.199], inf),
	\att, 0.05,
	\rel, 4, //Pwhite(0.9, 3),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf)*0.3*~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 1/16,
	\rate, 1, // THIS IS COOL
	\startPos, Pwhite(0.85,0.86,inf), //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 1, //Pwhite(0.9, 3),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0.05, 0.1, 0.2, 0.3,   0.4, 0.6, 0.8, 1,
        0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0, 0,
		0, 0, 0, 0,   0, 0, 0 ,0,
	], inf)*0.21*~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983B'),
	\dur, 4/8,
	\rate, 0.50, // THIS IS COOL
	\startPos, 0.32, //Pseq([0.2, 0.199], inf),
	\att, 0.05,
	\rel, 4, //Pwhite(0.9, 3),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 0, // beat 4
	], inf)*0.3*~gamp,
).play(~clock, quant: 4).quant = 4;
)



// TOOLS
/*
 // uncomment the whole thing by deleting the /* in the beginning of this line
// Pause all Pbindefs:
Pbindef.all.do{|i| i.pause };

// Resume all:
Pbindef.all.do{|i| i.resume };

// If everything is broken:
Pbindef.all.do({ |i| i.clear });

// Pause / resume individual Pbindefs:
Pbindef(\p1).pause;
Pbindef(\p2).pause;
Pbindef(\p3).pause;
Pbindef(\p4).pause;
Pbindef(\p5).pause;
Pbindef(\p6).pause;
Pbindef(\p7).pause;
Pbindef(\p8).pause;

Pbindef(\p1).resume;
Pbindef(\p2).resume;
Pbindef(\p3).resume;
Pbindef(\p4).resume;
Pbindef(\p5).resume;
Pbindef(\p6).resume;
Pbindef(\p7).resume;
Pbindef(\p8).resume;
