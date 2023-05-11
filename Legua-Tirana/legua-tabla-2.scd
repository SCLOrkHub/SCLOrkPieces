
// Load Samples first

d.tabla1 // check that sample is there

// ~bpm.(155)

(
var intervals;
intervals = [0, 12, 3, 12];
// intervals = [0, 12, 5, 12];

Ndef(\tabla2).quant = 12;
Ndef(\tabla2, Pbind(
	\instrument, "pb2",
	\buf, d.tabla1,
	\dur, 3,
	\rate, Pseq(intervals.midiratio, inf) * -0.5.midiratio,
	\amp, Pseq([1, 0.8, 0.5, 0.4], inf)
)).play;
)

Ndef(\tabla2).stop(10);
