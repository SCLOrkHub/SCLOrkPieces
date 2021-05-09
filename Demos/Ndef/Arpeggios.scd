(
// remember to change name!!!!!!!!!!!!!
Ndef(\bruno).fadeTime = 1;
Ndef(\bruno, {
	var snd = SinOsc.ar(
		freq: 43
		* 2.pow(Stepper.ar(
			trig: Impulse.ar(8),
			reset: 0,
			min: 1,
			max: 4,
			step: 1
		))
		// * LFPulse.ar(1/2).range([1, 1.5], [1, 1.5]*1.25)
		,
		mul: 0.2 * SinOsc.ar(LFNoise2.ar(1).range(1/2, 3)) // volume
	);
	snd = snd.fold(-0.4, 0.4);
	snd = FreeVerb.ar(snd, 0.5, 0.6);
	snd = Pan2.ar(Mix(snd), SinOsc.ar(1/7));
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
)
