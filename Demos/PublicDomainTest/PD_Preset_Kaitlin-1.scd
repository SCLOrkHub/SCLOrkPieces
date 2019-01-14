// ===============
// COMPOSE!
// Here are a bunch of Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============



// ================
// PRESET Kaitlin-1
// ================
// Scroll all the way down for additional TOOLS for quick start, stop, clear the Pbindefs


// Pbindef.all.clear //empty pbinds

(
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
)



/*
// TOOLS

/ // uncomment the whole thing by deleting the /* in the beginning of this line
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
