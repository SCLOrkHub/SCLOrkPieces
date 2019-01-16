// ========
// PBINDEFS
// ========
// Scroll all the way down for additional TOOLS for quick start, stop, clear the Pbindefs

(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1994B'),
	\dur, 4,
	\rate, 120/124,
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1994B'),
	\dur, 4,
	\rate, 120/124 * Pseries(1, 0.005, inf),
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1994B'),
	\dur, 4,
	\rate, 120/124 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1994B'),
	\dur, 8,
	\rate, 120/124 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.5,
	\att, 0.01,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([Pn(0, 12), Pseq([1, 0.9, 0.5, 0], inf)])
).play(~clock, quant: 4).quant = 4;

)



// TOOLS
// uncomment the whole thing by deleting the /* above
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