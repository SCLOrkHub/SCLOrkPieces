
// ============================
// 1) IF USING SCLOrkSynths
// Load SCLOrkSynths first

(
Ndef(\a).quant = 4;
Ndef(\a,
	Pbind(
		\instrument, "hihat1",
		\dur, 1/4,
		// \dur, Pseq([1/4, 1/4, 1/4, 1/8, 1/8], inf),
		\att, 0.01,
		\rel, 0.1,
		\ffreq, 5000, //Pn(Pseries(1000, 200, 64)),
		\pan, 0,
		\amp, Pwhite(0.2, 1)
	)
).play;
)


(
Ndef(\b).quant = 4;
Ndef(\b,
	Pbind(
		\instrument, "snare1",
		\dur, Pseq([
			Rest(1/2), 1/2,
			Rest(1/2), 1/2,
			Rest(1/2), 1/2,
			Rest(1/4), 1/4, Rest(1/4), 1/4
		], inf),
		\att, 0.01,
		\rel, 0.1,
		\sinfreq, 180,
		\ffreq, 2000,
		\amp, 0.25
	)
).play;
)



(
Ndef(\c).quant = 4;
Ndef(\c,
	Pbind(
		\instrument, "kick1",
		\dur, Pseq([1, 1, Rest(1/2), 1/2, Rest(1/4), 3/4], inf),
		\att, 0.01,
		\rel, 0.22,
		\sinfreq, Pseq([60, 60, \r, 70, \r, 67], inf),
		\glissf, 0.9,
		\amp, 1,
	)
).play;
)

(
Ndef(\a).stop;
Ndef(\b).stop;
Ndef(\c).stop;
)






// ============================
// 2) IF USING Dirt Samples
// Load Samples first

~bpm.(120)

(
Ndef(\k1).quant = 4;
Ndef(\k1,
	Pbind(
		\type, \dirt,
		\sampleName, \bd0,
		\dur, Pseq([1, 1, 1, 1/2, 1/2], inf),
		\amp, 0.5,
		\rate, 1,
	)
).play;
)


(
Ndef(\hh).quant = 4;
Ndef(\hh,
	Pbind(
		\type, \dirt,
		\sampleName,\a808oh0,
		\dur, Pseq([
			Rest(1/2), 1/2,  // b1
			Rest(1/2), 1/2,  // b2
			Rest(1/2), 1/2,  // b3
			Rest(1/4), 1/4, 1/4, 1/4,  // b4
		], inf),
		\amp, 1,
		\rate, 1, //Pseq([0.5, 0.3, 1, 1, 2, 2, 1, 1], inf),
	)
).play;
)


// You could also use many different samples within one same Pbind
(
Ndef(\many).quant = 4;
Ndef(\many,
	Pbind(
		\type, \dirt,
		\sampleName,Pseq(
			[
				\amencutup0,
				\cp0,
				\cp1,
				\hh2,
				\hh3,
				\techno1,
				\amencutup13,
				\techno1
			],
			inf),
		\dur, Pseq([
			1/2,
			1/4,
			1/4,
			1/4,
			1/4,
			1/2,
			1,
			1
		], inf),
		\amp, 1,
		\rate, 1, //Pseq([0.5, 0.3, 1, 1, 2, 2, 1, 1], inf),
	)
).play;
)

Ndef(\many).stop(2);