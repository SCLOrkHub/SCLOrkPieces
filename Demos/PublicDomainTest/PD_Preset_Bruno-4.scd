// ===============
// COMPOSE!
// Here are a bunch of Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============



// ================
// PRESET BRUNO-4
// ================
// Scroll all the way down for additional TOOLS for quick start, stop, clear the Pbindefs

(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 4,
	\rate, 120/124 * Pseq([Pn(1, 6), Pn(2, 6)], inf), // THIS IS COOL
	\startPos, 0, //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 1/8,
	\rate, 120/124, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Prand([0.69, 0.7, 0.87], inf), //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Pwhite(0.3, 0.6),
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 1/8,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 1, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1952A'),
	\dur, 1/8,
	\rate, -1.18 * Pwrand([1, 6/5], [0.9, 0.1], inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.4, //Pseq([0.2, 0.199], inf),
	\att, 0.051,
	\rel, Prand([0.1, 0.2], inf) * 1,
	\amp, Pseq([
		1, 0, 0, 1,   0, 0, 0, 0, // beat 1
		1, 0, 0, 1,   0, 0, 0, 1, // beat 2
		1, 1, 0, 1,   0, 0, 0, 0, // beat 3
		0, 0, 0, 1,   1, 0, 1, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 1/8,
	\rate, Prand([1, 1.5, 2, 2.5], inf),
	\startPos, Pn(Pseries(0, 0.1, 10), inf), //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([
		0, 1, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 0.5,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1994A'),
	\dur, 1/8,
	\rate, 0.95,
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 1, 0, // beat 4
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1952A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1.0, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, Pn(Pseries(0.1, 0.04, 32), inf),
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([
		1, 0, 1, 0,   1, 0, 1, 0, // beat 1
		1, 0, 1, 0,   1, 0, 1, 0, // beat 2
		1, 0, 1, 0,   1, 0, 1, 0, // beat 3
		1, 0, 1, 0,   1, 0, 1, 1, // beat 4
	], inf),
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
