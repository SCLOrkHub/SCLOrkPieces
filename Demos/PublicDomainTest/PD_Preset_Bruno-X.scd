// ================
// PRESET BRUNO-X
// ================

// Hancock

// Sweet spot for changes:
// a) add / remove one or two hits ('1' value) into your amp
// b) your startPos ~hancockStartPos should most of the time match your player number, but try to occasionally change it to another player number (1-8)
// for example, if you are ~hancockStartPos[1], you may try ~hancockStartPos[4], etc.
// c) one or two players at a time might try rate -1 (reverse sound), or even -2


(
// Loop duration -- abs times taken from audio file (seconds)
~hancockLoopDur = 16.529 - 11.411;
// Start positions divided by 8 laptops
~hancockStartPos = [nil] ++  Array.series(8, 11.411, 16.529 - 11.411 / 8);
// ~hancockStartPos[8];

Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos, ~hancockStartPos[1] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([1, 0, 0, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;

Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[2] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.03,
	\amp, Pseq([0, 1, 0, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;

Pbindef(\p3,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[3] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([0, 0, 1, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;

Pbindef(\p4,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[4] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 1, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;

Pbindef(\p5,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[5] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 1, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;

Pbindef(\p6,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[6] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 1, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;


Pbindef(\p7,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, 1,
	\startPos,  ~hancockStartPos[7] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 1, 0], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;


Pbindef(\p8,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, ~hancockLoopDur / 8,
	\rate, Prand([1, 1, 1, 1.5], inf),
	\startPos,  ~hancockStartPos[8] / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 0, 1], inf),
	\legato, 1
).play(~clock, quant: 4).quant = ~hancockLoopDur;

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


/*
// tight loop
(
Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 16.529 - 11.411, // abs times taken from audio file
	\rate, 1,
	\startPos, 11.411 / ~mySamples.at('1973C').duration,
	\att, 0.01,
	\rel, 0.01,
	\amp, 1,
	\legato, 1
).play(~clock, quant: 4).quant = 4;
)
*/
