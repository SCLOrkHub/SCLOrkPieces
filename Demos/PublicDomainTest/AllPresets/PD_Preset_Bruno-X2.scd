// ==================================
// Preset: Bruno-X2
// Number of voices: 8
// Most recent year sampled: 1973
/* Comments: This is like Bruno-X but removed global variables.
Loop duration - abs times taken from audio file (seconds) - 5.118 comes from 16.529 - 11.411
Start positions split over 8 laptops - I took a list of abs start pos Array.series(8, 11.411, 5.118 / 8) and divided by total sample duration (~mySamples.at('1973C').duration)
*/
// ==================================


Pbindef(\p1,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1,
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([1, 0, 0, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;

Pbindef(\p2,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1, // try -1 for reverse effect, or 1.5 for slight offbeat
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.03,
	\amp, Pseq([0, 1, 0, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;

Pbindef(\p3,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1, // try -1 for reverse effect, or 1.5 for slight offbeat
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf), // try a Pshuf instead of Pseq
	\att, 0.01,
	\rel, 0.3,
	\amp, Pseq([0, 0, 1, 0, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;

Pbindef(\p4,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1, // try -1 for reverse effect, or 1.5 for slight offbeat
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 1, 0, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;

Pbindef(\p5,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1, // try -1 for reverse effect, or 1.5 for slight offbeat
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 1, 0, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;

Pbindef(\p6,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1, // try -1 for reverse effect, or 1.5 for slight offbeat
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 1, 0, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;


Pbindef(\p7,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, 1, // try -1 for reverse effect, or 1.5 for slight offbeat
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 1, 0], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;


Pbindef(\p8,
	\instrument, "playBufASR",
	\bufnum, ~mySamples.at('1973C'),
	\dur, 5.118 / 8, // loop dur divided by 8
	\rate, Prand([1, 1, 1, 1.5], inf), // try negative numbers for reverse
	\startPos, Pseq([0.5132, 0.542, 0.5708, 0.5995, 0.6283, 0.6571, 0.6858, 0.7146], inf),
	\att, 0.01,
	\rel, 0.1,
	\amp, Pseq([0, 0, 0, 0, 0, 0, 0, 1], inf),
	\legato, 1
).play(~clock, quant: 5.118).quant = 5.118;
