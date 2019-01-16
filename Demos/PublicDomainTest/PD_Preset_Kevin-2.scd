// ===============
// COMPOSE!
// Here are a bunch of Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============

// Pause all Pbindefs:
Pbindef.all.do{|i| i.pause };

// Resume all:
Pbindef.all.do{|i| i.resume };

// If everything is broken:
Pbindef.all.do({ |i| i.clear });

// ================

Pbindef(\p1).pause;            //Newman - Less than Zero BSS1
Pbindef(\p1).resume;

Pbindef(\p2).pause;           //Newman - Less than Zero PERC2
Pbindef(\p2).resume;

Pbindef(\p3).pause;           //Newman - Less than Zero STRNG3
Pbindef(\p3).resume;

Pbindef(\p4).pause;           //Newman - Less than Zero PERC4
Pbindef(\p4).resume;

Pbindef(\p5).pause;           //Police - Every Breath You Take
Pbindef(\p5).resume;

Pbindef(\p6).pause;            //Police - Every Breath You Take
Pbindef(\p6).resume;

Pbindef(\p7).pause;             //Police - Every Breath You Take
Pbindef(\p7).resume;

Pbindef(\p8).pause;             //Police - Every Breath You Take
Pbindef(\p8).resume;


(
Pbindef(\p1,                              //Newman - Less than Zero
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 4,
	\rate, 1/2,
	\startPos, Pseq([0.7, 0.81], inf),
	\att, 0.01,
	\rel, 10, //Pwhite(0.9, 3),
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8,
	\rate, 0.5 * Pwrand([1, 6/5], [0.9, 0.1], inf), //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.4, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Prand([4, 14], inf) * 1,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8,
	\rate, Pseq([0.2, 0.5, 0.2, 0.5], inf),
	\startPos, Pseq([0.7, 0.4, 0.3], inf), //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 10, //Pwhite(3, 14),
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 1, 0,   0, 0, 1, 0, // beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;



Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, Pseq([1, 0.5, 0.25, 0.5], inf),
	\startPos, Pseq([0.4, 0.5, 0.6, 0.7], inf),
	\att, 0.1,
	\rel, Pwhite(4, 18),
	\amp, Pseq([
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0.5, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0.5, 0.5, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p5,                             //Police - Every Breath You Take
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\dur, 1/8,
	\rate, Pseq([0.5, 0.75, 0.5, 0.5], inf),
	\startPos, Pseq([0.2, 0.1], inf),
	\att, 0.1,
	\rel, 4,
	\amp, Pseq([
		0.25, 0, 0, 0,   0, 0.25, 0, 0, // beat 1
		0, 0, 0.25, 0,   0, 0, 0, 0.25, // beat 2
		0, 0, 0.25, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\rate, Pseq([0.71, 0.5, 0.72, 0.5], inf),
	\startPos, Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 6,
	\amp, Pseq([
		0, 0.4, 0, 0.6,   0, 0.5, 0, 0.6, // beat 1
		0, 0, 0.3, 0,   0, 0, 0.2, 0, // beat 2
		0, 0.1, 0, 0,   0, 0.4, 0, 0, // beat 3
		0.5, 0.6, 0, 0,   0, 0, 0.8, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;


Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\dur, 1/8,
	\rate, Pseq([0.75, 0.5, 0.75, 0.5], inf),
	\startPos, Pn(Pseries(0, 0.1, 10), inf), //Pseq([0.2, 0.199], inf),
	\att, 0.01,
	\rel, 6,
	\amp, Pseq([
		0, 1, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) * 0.5,
).play(~clock, quant: 4).quant = 4;


Pbindef(\p8,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1983A'),
	\dur, 1/8,
	\rate, Pseq([0.75, 0.5, 0.75, 0.5], inf),
	\startPos, Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 12,
	\amp, Pseq([
		0, 0.5, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0.5, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0.5, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0.5, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

)



// TOOLS

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
