// wait until k is not nil (conductor will create k)
k.postln;


(
var samples;
samples = k[8];
// samples = [ ];

Ndef(\name1).quant = 4; // customize name
Ndef(\name1, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 0.2,
		\rate, 1,
		// \rate, Pn(Pgeom(1, 1.01, 7))
	)
).play
)