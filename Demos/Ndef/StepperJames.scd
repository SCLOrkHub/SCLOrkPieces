// ++ code copied from james
(
// remember to change name!!!!!!!!!!!!!
Ndef(\jam).fadeTime = 1;
Ndef(\jam, {
	var snd = SinOsc.ar(
		freq: 8
		* 2.pow(Stepper.ar(
			trig: Impulse.ar(0.4),
			reset: 0,
			min: 1,
			max: 5,
			step: 1
		))
		* [9, 12, 18]
		* LFNoise2.ar(1/4).range(1, 1.5)
		,
		mul: 0.025 * LFTri.ar(LFNoise2.ar(1).range(1/2, 1)) // volume
	);
	snd = Clip.ar(snd*10, -0.4, 0.4);
	snd = RLPF.ar(snd, 500, 0.01);
	snd = snd.fold(-0.5, 0.5);
	snd = FreeVerb.ar(snd);
	snd = Pan2.ar(Mix(snd), SinOsc.ar(1));
	snd = Limiter.ar(snd) * 1/4; // another master volume control
}).play;
)
// -- end of copied code


Ndef(\jam).stop(10);