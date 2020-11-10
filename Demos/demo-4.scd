(
Ndef(\a).fadeTime = 2;
Ndef(\a).play;
)

// Using Ndef "slots"
// source sound is at slot zero:
(
Ndef(\a)[0] = { |freq = 440, amp = 0.5, glissStart = 1.6, glissEnd = 1, glissDur = 14, pan = 0|
	var env, gliss, trigger, snd;
	env = LFTri.ar(
		freq: 1/10,
		mul: amp
	);

	gliss = LFSaw.kr(1/14).range(glissStart, glissEnd);

	snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: freq * [1, 1.001, 2, 3] * gliss
	);

	snd = LPF.ar(
		in: snd,
		freq: SinOsc.ar(MouseY.kr(4, 12)).range(150, 4000)
	);
	snd = snd * env;
	snd = Pan2.ar(Mix.ar(snd), pan);
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
	snd = Limiter.ar(snd);
};
)

// pbind controlling sound parameters is is slot 1
(
Ndef(\a)[1] = \set -> Pbind(
	\midinote, Prand([
		Pseq([67, 69, 64, 53, 60]),
		Pseq([67, 69, 65, 53, 60]),
		Pseq([67, 69, 72, 53, 60]),
		Pseq([72, 74, 70, 53, 60])
	], inf),
	\glissStart, 2,
	\glissEnd, 1,
	\dur, Pseq([1, 0.5, 0.25, 0.25], inf),
	\amp, Pwhite(0.1, 0.3)
)
)


// adding an effect to the chain (another slot in same Ndef):
(
Ndef(\a)[2] = \filter -> { |in|
	Decimator.ar(
		in: in,
		rate: LFNoise0.ar(1).range(10000, 15000),
		bits: LFNoise2.ar(1/4).range(6, 15)
	);
}
)

// some built-in convenience methods
Ndef(\a).xset(\wet2, 0); // uses fadeTime
Ndef(\a).set(\wet2, 0.7); // does not use fadeTime

// remove Pbind from slot 1
Ndef(\a)[1] = nil;
















