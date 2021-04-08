//
// demo-2
//

~bpm.(130);

// beat
(
var samples;
samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest

Ndef(\bx).quant = 4;
Ndef(\bx,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 8,
		\amp, Pseq([0.4, Pgeom(0.25, 1.2, 5), Pn(0.4, 3), 1.9], inf),
		\rate, Pwhite(1, 1.01) * 1
		* Pfunc({ |e|
			if(e.sampleName === \dork22, { -1.09 }, { 1 })
		}),
	)
).play;
)

// dark synth
(
Ndef(\ssaw).quant = 4;
Ndef(\ssaw,
	Pbind(
		\instrument, "feedbackPad1",
		\note, Pseq([0, 2, 3, 0, 2, 3, 5, 3, 2, 7, 0, -7], inf),
		\ctranspose, [-12, -12.1, 0.1, 0.05],
		\amp, 0.05,
		\legato, 1,
		\att, 0.1,
		\dur, Pseq([3, 3, 8, 2, 8, 3, 3, 5, 1], inf) * Prand([1, 0.5, 0.5], inf),
		\fbPeak, Pseq([0.5, 0.5, 0.87, 0.5, 0.69, 0.5, 0.5, 0.9, 0.4], inf),
		\fbSus, 0.3,
		\pan, Pwhite(-1, 1.0)
	);
).play;
)


// effects
(
Ndef(\fx2).fadeTime = 2;
Ndef(\fx2, {
	var snd;
	snd = Ndef(\ssaw).ar + Ndef(\bx).ar;
	snd = RHPF.ar(
		in: snd,
		freq: LFNoise2.ar(1/4).range(100, 1220),
		rq: LFNoise1.ar(1/5).range(0.1, 0.7)
	);
	snd.distort.tanh;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.27,
		damp: 0.97,
		mul: 1
	);
}).play;
)

// stop source, listen to fx2 only
Ndef(\ssaw).stop(3);
Ndef(\bx).stop(2);

// and back
Ndef(\bx).play;
Ndef(\ssaw).play;

// actually free the synths
Ndef(\bx).free(10); Ndef(\ssaw).free(10);