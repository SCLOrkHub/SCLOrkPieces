
// Load Samples first

d.legua1 // check that sample is there

// ~bpm.(155)

(
Ndef(\shakerSample).quant = 12;
Ndef(\shakerSample,
	Pbind(
		\instrument, "pb1",
		\buf, d.legua1,
		\dur, 12,
		\amp, 1,
		\rate, 1
)).play;
)

Ndef(\shakerSample).stop(4);


