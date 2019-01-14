// PD Preset Miles-1



(
//Usher's YEAH!
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2004A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, (60/105)*1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.45,
	\att, 0.01,
	\rel, 6,
	\crv, 4,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf)/2,
).play(~clock, quant: 4).quant = 4;

//Hi hat
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 5,
	\startPos, 0.3085,
	\att, 0.01,
	\rel, 0.25,
	\amp, Pseq([
		1, 0, 1, 0,   1, 0, 1, 0, // beat 1
		1, 0, 1, 0,   1, 0, 1, 0, // beat 2
		1, 0, 1, 1,   1, 0, 1, 0, // beat 3
		1, 0, 1, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

//Clap
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2003A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1,
	\startPos, 0.3085,
	\att, 0.01,
	\rel, 0.5,
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0, // beat 1
		0, 0, 0, 0,   1, 0, 0, 0, // beat 2
		0, 0, 0, 0,   1, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 1, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

//The first row will always be 0.8 rate, second row 0.725, etc..
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2001A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, Pseq([
		Pseq([0.8], 8),
		Pseq([0.725], 8),
		Pseq([0.8], 8),
		Pseq([1.09], 8),
	], inf)*1,
	\startPos, 0.1,
	\att, 0.005,
	\rel, 0.3,
	\amp, Pseq([
		0, 1, 0, 0,   1, 0, 0, 1, // beat 1
		0, 0, 0, 0,   1, 0, 0, 0, // beat 2
		0, 1, 0, 0,   1, 0, 0, 1, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
)


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



