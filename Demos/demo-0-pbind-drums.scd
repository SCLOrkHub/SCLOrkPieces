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