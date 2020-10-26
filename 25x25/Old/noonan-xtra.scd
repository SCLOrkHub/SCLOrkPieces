(
var samples;

samples = [[\tech5, \stab13, \peri12], \drum1, [\hh3, \techno1], \east3];
// samples = [[[\tech5!1, \stab13, \peri12], \hh274!2], [\drum1, \hh274!2], [\hh3, \techno1], [\east3, \hh274!2]];


Ndef(\mixedloop).quant = 4;
Ndef(\mixedloop,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pwhite(0.4, 0.6),
		\rate, Pwhite(1, 1.02)
	)
).play
)

Ndef(\mixedloop).stop;

(
var samples = [\r, \glitch25, \glitch25, \glitch25, \r, \r, \glitch25!2, \r, \glitch25, \glitch25!4, \r, \glitch25, \r, \glitch25, \r, \r];

Ndef(\glitches).quant = 4;
Ndef(\glitches,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf).trace,
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 2,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf)*2,
		\rate, Pwhite(2, 4)
	)
).play;
)

Ndef(\glitches).stop;

(
var samples;

samples = [[\hardcore5, \sid10!2], [\hardcore5, \invaders1!2], \hardcore5!4];
Ndef(\mixedloop2).quant = 4;
Ndef(\mixedloop2,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([1, 0.5, 0.5, 1, 0.5, 0.5, Pn(1, 4)], inf)*2,
		\rate, Pseq([Pwhite(1/2, 2, 3), Pwhite(1, 1.4, 3), Pwhite(1/2, 3/4, 3)], inf)
	)
).play;
)

Ndef(\mixedloop2).stop;

(
var samples = [\r, \bass20, \r, \r, \bass20!3, \r, \r, \r, \r, \r, \bass20!8];


Ndef(\chaosbass).quant = 4;
Ndef(\chaosbass,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 1/3,
		\amp, Pseq([Pwhite(0.3, 0.5, 13), Pn(1, 6)], inf)/8,//Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6,
		\rate, Pseq([Pwhite(1, 2, 11), Pn(3, 4)], inf)// * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

Ndef(\chaosbass).stop;

(
var samples;
samples = [\gretsch19, \gretsch6];
// samples = [\gretsch19, \gretsch19, \gretsch6];
// samples = [\gretsch19, \gretsch19, \gretsch6, \gretsch19, \gretsch6];
// samples = [\gretsch19, \gretsch19, \gretsch6, \gretsch19, \gretsch6, \gretsch19, \gretsch6];


Ndef(\cymbalz).quant = 4;
Ndef(\cymbalz,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 2,
		\amp, Pseq([Pwhite(0.3, 0.5, 13), Pn(1, 6)], inf)*2,//Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6,
		\rate, Pseq([Pwhite(1, 2, 11), Pn(3, 4)], inf)// * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

Ndef(\cymbalz).stop;

(
var samples;
// samples = [\stab9, \stab8];
// samples = [\stab9!3, \stab8!8];
samples = [\stab9!2, \r, \stab8, \r, \r];
// samples = [\stab9!4, \r, \r, \stab8, \r, \stab8, \r, \r];


Ndef(\stabz).quant = 4;
Ndef(\stabz,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 0.6,//Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6,
		\rate, 1/2// * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

Ndef(\stabz).stop;

(
var samples;
samples = [\amencutup18, \amencutup14, \amencutup14, \amencutup14, \amencutup17, \amencutup14, \amencutup14, \amencutup14];
samples = [\amencutup18!2, [\amencutup14, \amencutup14], \amencutup14, [\amencutup17, \amencutup14], [\amencutup14, \amencutup14]];

Ndef(\mixedloop3).quant = 4;
Ndef(\mixedloop3,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pwhite(0.4, 0.6),//Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6,
		\rate, Pwhite(1, 1.02)// * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)
Ndef(\mixedloop3).stop;
