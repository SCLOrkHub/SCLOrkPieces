//
// demo-k.scd
//

// run k array at bottom first


// Wait until k is not nil (conductor will create k)
k.postln;

// Variable k will contain 50 randomly-generated lists of samples
// Pick a list by number, ie, k[3], k[34], etc.
(
var samples;
samples = k[30];
samples = k[39];
Ndef(~myName.asSymbol,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 16, // Prand([1, 1, 1, 1, 1, 0.5], inf),
		\amp, 0.25,
		\rate, Pn(Pseries(0, 1, 7)).midiratio,
		// \rate, Pn(Pgeom(1, 1.01, 7))
	)
).play.quant_(4).fadeTime_(0);
)


(
var samples;
samples = k[30];
samples = k[20];
Ndef(\bruno2,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 8,
		\amp, 0.5,
		\rate, Pn(Pseries(1, 0.05, 20)),
		// \rate, Pn(Pgeom(2, 1.01, 7))
	)
).play.quant_(4).fadeTime_(0);
)

(
var samples;
samples = k[47];
// samples = k[19];
Ndef(\bruno3,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 2,
		// \legato, 0.3,
		\amp, 0.45,
		// \rate, Pn(Pseries(1, 0.1, 10)),
		\rate, Pwhite(1, 5)
	)
).play.quant_(4).fadeTime_(0);
)

(
var samples;
samples = k[10];
samples = k[13];
Ndef(\bruno4,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 2,
		\amp, 0.35,
		\rate, Pn(Pseries(1, 0.1, 10)),
		// \rate, Pn(Pgeom(1, 1.01, 7))
	)
).play.quant_(4).fadeTime_(0);
)

Ndef(\bruno4).stop(2);

~listAll.()
(
Ndef(\fx, {
	var in, snd;
	// in = Ndef(\bruno1).ar + Ndef(\bruno).ar + Ndef(\bruno3).ar;
	in = [Ndef(\bruno).ar, Ndef(\bruno2).ar, Ndef(\bruno3).ar, Ndef(\bruno4).ar];
	// in = Ndef(\bruno).ar * 1;
	// snd = in * LFPulse.ar(p.clock.tempo * 4, 0, 0.23).range(0.0, 1);
	snd = in * LFPulse.ar(p.clock.tempo * [1, 2, 3], 0, 0.3).range(0, 0.7);

	snd = CombC.ar(
		in: snd,
		maxdelaytime: p.clock.tempo,
		delaytime: p.clock.tempo / [2, 4, 3].scramble,
		decaytime: [2, 3, 4] + 2
	);

	snd = snd * SinOsc.ar(LFSaw.ar(1/3).range(100, 1000).round(100)).range(0, 1);

	snd = RHPF.ar(
		in: snd,
		freq: LFTri.ar(1/5).range(234, 3560),
		rq: LFNoise0.ar(1/4).range(0.1, 0.25)
	);
	snd = GVerb.ar(
		in: snd,
		roomsize: 5,
		revtime: 4,
		damping: 0.5,
		drylevel: 0.2,
		earlyreflevel: 0.8,
		taillevel: [0.1, 0.3, 0.5].scramble
	);
	snd = Limiter.ar(snd.flat);
	snd = Splay.ar(snd);
}).play.fadeTime_(2);
)


























// for the conductor:

~bpm.(rrand(60, 120));

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