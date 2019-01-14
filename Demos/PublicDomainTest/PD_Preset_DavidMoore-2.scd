// ===============
// COMPOSE!
// Here are a bunch of Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============



// ================
// PRESET David-2
// ================

(
~gamp=1;

Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/4,
	\rate, 0.8, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.035, //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 0.4,
	\amp, Pseq([
		0, 1, 0, 1,   0, 1, 0, 1, // beat 1
		0, 1, 0, 1,   0, 1, 0, 1, // beat 2
		0, 1, 0, 1,   0, 1, 0, 1, // beat 3
		0, 1, 0, 1,   0, 1, 0, 1, // beat 4
	], inf) * 1.5 *~gamp,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1935A'),
	\dur, 1/4,
	\rate, 0.85, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.851],inf), //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 0.7,
	\amp, Pseq([
		1, 0, 0, 0,   1, 0, 0, 0, // beat 1
		1, 0, 0, 0,   1, 0, 0, 0, // beat 2
		1, 0, 0, 0,   1, 0, 0, 0, // beat 3
		1, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 1.5 *~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 1/2,
	\rate, Pseq([1.01,0.1,0.8,0.1],inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([0.038,0.1,0.183,0.1],inf), //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, Pseq([8,1,3,1],inf),
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1 *~gamp,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1946A'),
	\dur, 1/4,
	\rate, Pseq([1.01],inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,  0, 0, 0, 0, // beat 2
		0.038, 0.039, 0.041, 0.042,   0.043, 0.044, 0.045, 0.046, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),  //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, Pseq([1],inf),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,  0, 0, 0, 0, // beat 2
		1, 0, 1, 1,   0, 1, 1, 1, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1.3 *~gamp,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1939A'),
	\dur, 1/2,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pseq([
		0, 0, 0, 0,   0, 0.27, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0.39, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
	\att, 0.02,
	\rel, 4,
	\amp, Pseq([
		0, 0, 0, 0,   0, 1, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 1, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf) * 1.1 *~gamp,
).play(~clock, quant: 4).quant = 4;


)



// TOOLS

/* // uncomment the whole thing by deleting the /* in the beginning of this line
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
