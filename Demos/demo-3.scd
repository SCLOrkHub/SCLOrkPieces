~bpm.(60);

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \flick11, \drum2, \techno1, \drum2];
// samples = [\dr7, \dr29!rrand(1, 3), \house2!2, \glitch23];
// samples = [\blip1, \blip0, \a808oh3, \blip1];
// samples = [\ab4, \alphabet6, Prand([\bass112, \sn1, \sn2]), \db3];

Ndef(\blah,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 1,
		\amp, Pdef(\blamp, Pseq([0.5, 0.45, 0.4, 0.3], inf) * Pwhite(0.1, 2)),
		\rate, Pstutter(4, Pseq([1, 1.1, 1.02, 0.998, 1.5], inf))
	)
).play.quant_(4);
)

// Note the use of Pdef above -- you can change it from outside now:

Pdef(\blamp, 0.1).quant_(0); // quant 0 makes change take effect immediately
Pdef(\blamp, 1).quant_(0);
Pdef(\blamp, Pn(Pseries(0.1, 0.2, 10))).quant_(0);
Pdef(\blamp, Pseq([0.75, 0.5, 0.4, 0.3], inf) * Pwhite(0.9, 1.2));


