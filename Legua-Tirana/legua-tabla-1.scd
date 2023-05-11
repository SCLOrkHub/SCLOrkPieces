
// Load Samples first

d.tabla1 // check that sample is there

// ~bpm.(155)

(
Ndef(\tabla1).quant = 12;
Ndef(\tabla1, Pbind(
	\instrument, "pb2",
	\buf, d.tabla1,
	\dur, 12,
	\rate, -0.5.midiratio,
	\amp, 1
)).play;
)

Ndef(\tabla1).stop(4)


