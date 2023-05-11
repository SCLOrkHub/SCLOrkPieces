
// Load Samples first

// ~bpm.(155)

(
var samples, stretch = 3;
samples = [\cp0, \cp0, \cp1];
// samples = [\cp0, \r, \cp1, \r, \cp0, \cp1!2];
// samples = [\cp0, \cp0, \cp1, \cp0, \cp1, \d0!2];
// samples = [\cp0, \cp0, \db1, \cp0, \cp1, \db10!2];
// samples = [\cp0, \cp0, \db1, \cr4, [\cp0, \feel1], \db10!2];
// samples = [\cp0, \feel1, \db1, \cr4, [\cp0, \feel1], \db10!2];

samples = [\cp0, \feel1, \db1, \cr4, [\cp0, \feel1], \db10!2];

// samples = [\cp0, \feel1, \db1, \cr4, [\cp0, \feel1], \db10!2, \flick6, \cp0, \cp0]; stretch = 6;

Ndef(\clap).quant = 12;
Ndef(\clap,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, stretch,
		\amp, Pseq([0.8, 0.6, 0.9], inf) * 1,
		\rate, 2,
	);
).play
)

Ndef(\clap).stop(12);


Ndef(\clap).stop(10);

