(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd;
	snd = SinOsc.ar(
		freq: Stepper.kr(Impulse.kr(8), 0, 60, 100, [2, 4, 6]).midicps,
		mul: LFPulse.kr([2, 4, 3, 1]) * 0.1
	);
	snd = snd.fold(-0.5, 0.5);
	snd = FreeVerb.ar(snd);
	snd = Splay.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\test).stop(3)