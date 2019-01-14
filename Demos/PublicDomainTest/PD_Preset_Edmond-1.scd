// ===============
// COMPOSE!
// Here are a bunch of Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============



// ================
// PRESET Edmond-1
// ================
// Scroll all the way down for additional TOOLS for quick start, stop, clear the Pbindefs
// Preset uses only parts from 1924 - Rhapsody In Blue

(

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
