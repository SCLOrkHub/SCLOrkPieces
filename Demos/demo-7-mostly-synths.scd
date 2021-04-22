// 2020-12-03

~bpm.(90);

(
var cycle;
cycle = [1, 0.8, [\r, 1/2, \r, 1/2], [1/2, 1/2]];
Ndef(\kd, // customize name
	Pbind(
		\instrument, "kick_electro",
		\dur, Pseq(~dursFrom.(cycle), inf),
		\stretch, 4,
		\amp, Pseq(cycle.flat, inf),
		\att, 0.001,
		\rel, 0.3,
	)
).play.quant_(4);
)

(
var cycle;
cycle = [
	2, 0.1, 0.1, 0.1,
	1, \r, 1, 1,
	\r, 0.5, \r, 1,
	\r, \r, 0.5, 1
];
Ndef(\sd, // customize name
	Pbind(
		\instrument, "clapElectro",
		\dur, Pseq(~dursFrom.(cycle), inf),
		\stretch, 8,
		\amp, Pseq(cycle.flat, inf) * 2,
		\att, 0.001,
		\rel, 0.3,
		\mix, Pwhite(0.1, 0.7),
		\fadeFreq, 2000
	)
).play.quant_(4);
)

(
var cycle;
cycle = [
	[1, 1], [0.8, 0.4], 0.5, [1/2, 1/2],
	1, 0.8!2, 0.5!2, [\r, 1],
	Prand([1, \r]), 0.8, 0.5, [1, 1, 1, 1]/2,
	[1, 1], 0.8!2, 0.5!3, [1/2, 1/2],
];
Ndef(\hh, // customize name
	Pbind(
		\instrument, "hihatElectro",
		\dur, Pseq(~dursFrom.(cycle), inf),
		\stretch, 8,
		\amp, Pseq(cycle.flat, inf) * Pwhite(0.5, 0.8),
		\att, 0.001,
		\rel, Pwhite(0.1, 0.3) * Pwrand([1, 3], [0.9, 0.1], inf),
		\filterFreq, Pwhite(5000, 6000)
	)
).play.quant_(4);
)


(
var samples;
samples = [\ab2, \notes3!2, [\r, \notes4], \cp0!4];
// samples = [ ];

Ndef(\samples, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pwhite(0.2, 0.8),
		\rate, 1
	)
).play.quant_(4);
)

(
var degrees;
degrees = [
	[Prand([0, -5b]), 0, \r, 2b],
	[[\r, [1, 0]], -2, \r, 0],
	[0, -3b, [-2, -1], \r],
	[0, -5, -2, 2]
];
Ndef(\bass, // customize name
	Pbind(
		\instrument, "acidOto3091" ,
		\scale, Scale.major,
		\degree, Pseq(degrees.flat, inf),
		\dur, Pseq(~dursFrom.(degrees), inf),
		\stretch, 8,
		\ctranspose, -25,
		\amp, Pwhite(0.2, 0.5),
		\att, 0.001,
		\rel, 0.1,
		\legato, Pif(Pkey(\dur)<0.1, 0.6, Pwhite(0.1, 0.3)),
		\filterRange, Pwhite(3, 4)
	)
).play.quant_(4).fadeTime_(0);
)


Ndef(\samples).play;
Ndef(\bass).play;
Ndef(\kd).play;
Ndef(\sd).play;
Ndef(\hh).play;