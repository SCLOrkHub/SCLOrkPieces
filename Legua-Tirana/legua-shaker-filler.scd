
// Load Samples first

d.legua1 // check that sample is there

// ~bpm.(155)

(
Ndef(\shakerFiller).quant = 12;
Ndef(\shakerFiller,
	Pbind(
		\instrument, "pb1",
		\buf, d.legua1,
		\dur, Prand([3, 6], inf),
		\amp, 1,
		\rate, Pwhite(0.99, 1.01) // * 1.5
)).play;
)

Ndef(\shakerFiller).stop(4);


