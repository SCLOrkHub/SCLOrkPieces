// ==================================
// Preset: Nicole-2
// Number of voices: 5
// Most recent year sampled: 1989
// Comments:
// ==================================


Pbindef(\p1,   //low whoosh
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1986A'),
	\dur, 4,
	\rate, 0.1,
	\startPos, 0.010,
	\att, 0.4,
	\rel, 5,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2, //lone piano note ~mystery~
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1925A'),
	\dur, 4,
	\rate, 1,
	\startPos, 0,
	\att, 1,
	\rel, 9,
	\amp, 1
).play(~clock, quant: 4).quant = 4;



Pbindef(\p3,   //funky factory sound like the little 'pssh' sound
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1982A'),
	\dur, 4,
	\rate, 0.25,
	\startPos, 0,
	\att, 0.7,
	\rel, 4,
	\amp, 0.5
).play(~clock, quant: 4).quant = 4;



Pbindef(\p4, //top melody - like stars twinkling above :)
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1989A'),
	\dur, 4,
	\rate, 1.2,
	\startPos, 0,
	\att, 0.1,
	\rel, 10,
	\amp, 1
).play(~clock, quant: 4).quant = 4;




Pbindef(\p5,  //shimmer!
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1987B'),
	\dur, 4,
	\rate, 5,
	\startPos, 0.5,
	\att, 1,
	\rel, 5,
	\amp, 1
).play(~clock, quant: 4).quant = 4;


