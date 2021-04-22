//
// demo 1
//


~bpm.(150);

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\techno2, \bd0, \cp0, \cp1];
// samples = [\bubble3!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house1, \house2, \cp0, \a808ht4];
// samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\control0, \gab7, Prand([\east2, \coins0])!2, \dork22]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \east2!3, \ifdrums0!3]; // \r is a rest
// samples = [\glitch23!2, \birds4, \can6!2, \ifdrums0!2]; //BIRD
// samples = [\glitch20, \e7!2, \bass1, \can7]; // NICE
// samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];
// samples = [\amencutup0, [\drum2, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];
// samples = [\house5, \cp1, \drum1, \sn1];
samples = [\house5, \cp1, \drum1, \east2];

Ndef(\b1).quant = 4;
Ndef(\b1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.8, 0.6, 0.8, 0.5], inf) * 1, //Pwhite(0.6, 1),
		\rate, Pstutter(4, Pseq([1, 2, 1.5, 0.5], inf)), //Pwhite(1, 1.01) * Prand([1, 1, 1, 1, 1, -1], inf)
	)
).play
)


// Stop monitoring the dry Ndef:
Ndef(\b1).stop; // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\b1).play; // or bring it back



// Easily add fx
(
Ndef(\fx).fadeTime = 0;
Ndef(\fx, {
	var snd;
	snd = Ndef(\b1).ar;
	snd = CombC.ar(
		in: snd,
		maxdelaytime: ~spb.value,
		delaytime: ~spb.value / 4,
		// delaytime: ~spb.value / SinOsc.ar(1/~spb.()).range(1, 4).round(1), // make delay in sync with tempo
		decaytime: 1
	);

	snd = snd.distort.tanh;

	// snd = Clip.ar(snd*SinOsc.ar(~spb.()).range(1, 20), -0.5, 0.5);

	// snd = RLPF.ar(snd, LFNoise0.ar(1/4).range(1000, 4000), LFTri.ar(1/2).range(0.5, 1).round(0.1));

	snd = FreeVerb.ar(
		in: snd,
		mix: 0.305,
		room: 0.57,
		damp: 0.97,
		mul: 1
	);
	snd = Limiter.ar(snd) * Ndef(\fxAmp, 1).kr; // note the use of an Ndef for control
}).play;
)

// Set fx amp to something else
Ndef(\fxAmp, 0);
Ndef(\fxAmp, 1);
// or even
Ndef(\fxAmp, { LFPulse.kr(10).range(0, 1) });


// Or stop monitoring the fx completely (arg is fade out time)
Ndef(\fx).stop(4);

Ndef(\fx).play; // add it back on

