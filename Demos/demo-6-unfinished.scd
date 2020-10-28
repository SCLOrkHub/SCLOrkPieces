~bpm.(72);


(
k = List.new;
50.do({
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

k[0]

~freeAll.();
// Document.new(string: "k = " ++ k.asCompileString);


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
		\rate, 1
	)
).play
)

(
var samples;
samples = k[2];
// samples = [ ];

Ndef(\name2).quant = 4; // customize name
Ndef(\name2, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 0.2,
		\rate, 0.9,
	)
).play
)

(
var samples;
samples = k[14];
// samples = [ ];

Ndef(\name3).quant = 4; // customize name
Ndef(\name3, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 0.2,
		\rate, Pn(Pgeom(1, 1.01, 7)),
	)
).play
)

