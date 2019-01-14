// Miles-2
(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1998A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 60/100 * 2,
	\startPos, 0.0556,
	\att, 0.01,
	\rel, 3,
	\crv, 4,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1995A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 0.5,
	\startPos, 0.2,
	\att, 0.01,
	\rel, 0.25,
	\amp, Pseq([
		1, 0, 1, 0,   0, 1, 0, 0, // beat 1
		0, 0, 1, 0,   0, 1, 0, 0, // beat 2
		0, 0, 1, 0,   0, 1, 0, 0, // beat 3
		0, 0, 1, 0,   0, 1, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, Pseq([
		1.5, 1, 0.89,
	], inf)*1,
	\startPos, 0.1,
	\att, 0.005,
	\rel, 1,
	\amp, Pseq([
		1, 1, 1, 1,   1, 1, 1, 1, // beat 1
		1, 0, 1, 0,   1, 0, 1, 0, // beat 2
		1, 0, 1, 0,   1, 0, 1, 0, // beat 3
		1, 0, 1, 0,   1, 0, 1, 0, // beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;
)

/*
An incomplete idea for a mid-range sample.
(
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, Pseq([
		0.75, 0, 0.8, 0, 0.8, 0, 1.08, 0,
		0, 0, 0.8, 0, 1.2, 0, 1, 0,
		0, 0, 0.9, 0, 1.08, 0, 0.9, 0,
		0, 0, 0.8, 0, 1.08, 0, 0.8, 0,
	], inf)*0.75,
	\startPos, 0.1,
	\att, 0.005,
	\rel, 1,
	\amp, Pseq([
		1, 0, 1, 0,   1, 0, 1, 0, // beat 1
		0, 0, 1, 0,   1, 0, 1, 0, // beat 2
		0, 0, 1, 0,   1, 0, 1, 0, // beat 3
		0, 0, 1, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
)
*/



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
