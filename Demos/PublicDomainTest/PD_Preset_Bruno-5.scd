// ========
// PBINDEFS
// ========
// Scroll all the way down for additional TOOLS for quick start, stop, clear the Pbindefs

(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 16,
	\rate, 1,
	\startPos, 0.35,
	\att, 0.1,
	\rel, Pseq([25, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.5, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 16,
	\rate, 1 * Pseries(1, 0.005, inf),
	\startPos, 0.35,
	\att, 0.1,
	\rel, Pseq([35, 15, 25, 35], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;


Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 8.1,
	\rate, 1 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.39 + Pseries(0, 0.05, 10),
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([1, 0.9, 0.9, 0], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 8,
	\rate, 1 * Pn(Pseries(1, -0.005, 70)),
	\startPos, 0.45,
	\att, 0.1,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pseq([Pn(0, 12), Pseq([1, 0.9, 0.5, 0], inf)])
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 10,
	\rate, 1,
	\startPos, Pwhite(0.6, 0.9),
	\att, 2,
	\rel, Pseq([15, 15, 25, 25], inf),
	\amp, Pwhite(0.5, 0.8)
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