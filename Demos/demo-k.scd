//
// demo-k.scd
//


// Wait until k is not nil (conductor will create k)
k.postln;

// Variable k will contain 50 randomly-generated lists of samples
// Pick a list by number, ie, k[3], k[34], etc.

(
var samples;
samples = k[31];
// samples = [ ];
Ndef(~myName.asSymbol,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 0.2,
		\rate, 1,
		// \rate, Pn(Pgeom(1, 1.01, 7))
	)
).play.quant_(4);
)


























/*
// for the conductor:

~bpm.(72);

(
k = List.new;
51.do({
	k.add(Array.fill(
		size: [8, 16].choose,
		function: { if(0.7.coin, { \r }, {
			if(0.5.coin,
				{
					d.keys.choose;
				}, {
					[
						d.keys.choose.dup(rrand(2, 4)),
						{ d.keys.choose }.dup(rrand(2, 4))
					].choose;
			});
		})
	}))
})
)

~freeAll.();

// run the contents of this other doc if you want k to be identical for all players
// (so that everyone hears the same sequences)
// otherwise, each player will have a different set of samples (could be fun)
Document.new(string: "k = " ++ k.asCompileString);

*/