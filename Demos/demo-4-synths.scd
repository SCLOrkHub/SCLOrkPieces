~bpm.(90);


// very basic Pbind, nothing extra
// all examples below are in 5/4 time signature just for fun
(
Ndef(\melody, // customize name
	Pbind(
		\instrument, "everythingRhodes",
		\dur, Pseq([1, 1, 0.5, 0.25, 0.25, 0.25, 0.125, 0.125, 0.5, 1], inf),
		\midinote, Pseq([Prand([66, 69]), 64, 67, 72, 74, 76, 74, 76, 74, 72], inf),
		\amp, 0.3,
		\att, 0.001,
		\rel, 2,
	)
).play.quant_(5);
)

SCLOrkSynths.synthArgs(\ksBass)
(
Ndef(\bass, // customize name
	Pbind(
		\instrument, "ksBass",
		\dur, Pseq([1, 1, 1, 2], inf),
		\midinote, Pseq([36, 48, 45, 57], inf),
		\amp, 0.5,
		\ctranspose, [-12, 0],
		\att, 0.001,
		\rel, Pseq([2, 1, 1, 3], inf),
	)
).play.quant_(5);
)

Ndef(\bass).stop;
Ndef(\melody).stop;


// A slightly different way: using the "cycles" built-in function
// Create an Array of elements that will fit onto a pre-defined number of beats ('stretch' value)
// Ex. 1 an array of 4 elements with a stretch of 4 will result in one event per beat.
// Ex. 2 an array of 8 elements with a stretch of 4 will result in two events per beat, etc.

(
var cycle;
cycle = [
	\r, 60!2, 78!2, 72!2, 69!3,
	64!2, 62, 60, \r, \r
];
Ndef(\anotherMelody,
	Pbind(
		\instrument, "everythingRhodes",
		\dur, Pseq(~dursFrom.(cycle).postln, inf), // never change this line
		\midinote, Pseq(cycle.flat, inf),
		\stretch, 5,
		\amp, 0.7,
		\att, 0.001,
		\rel, Pseq([2, Pn(0.2, cycle.flat.size-1)], inf)
	)
).play.quant_(5);
)

Ndef(\anotherMelody).clear


// same idea used with a percussion instrument
// cycle values can be used as amplitude values
(
var cycle;
cycle = [
	[2, 1], [0.8, 0.4], 1, [0.5, 0.5], 1,
	1,       0.5,       0.5, [\r, 1],    1,
	// Prand([1, \r]), 0.8, 0.5, [1, 1, 1, 1]/2,
	// [1, 1], 0.8!2, 0.5!3, [1/2, 1/2],
];
Ndef(\hh, // customize name
	Pbind(
		\instrument, "hihat1",
		\dur, Pseq(~dursFrom.(cycle), inf),
		\stretch, 5,
		\amp, Pseq(cycle.flat, inf) / 2,
		\att, 0.001,
		\rel, Pwhite(0.1, 0.3),
		\ffreq, Pwhite(1000, 6000)
	)
).play.quant_(5);
)
// 