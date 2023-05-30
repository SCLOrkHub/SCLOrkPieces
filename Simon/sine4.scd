// Start out with your fadetime set to 60, after about 60 seconds, bring it down to anywhere between 10-20. At this point you will want to start changing pitch as you please. This will be changing the "freq" parameter. Stay within the range of the pitch. Listen to the sounds around you, you want to create beatings with yourself, and others. Thus change by small number (ex. 144-145).

// fade in manually with the k6
(
Ndef(\sine4).fadeTime = 7;
Ndef(\sine4, {
	var snd;
	snd = SinOsc.ar(
		freq: 100,
		mul: 1.0
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sine4).stop(30);
Ndef(\sine4).clear;

// You can change the frequencies if you want, but keep them within just a few of the original, (ex. 40 to 42).
//The main parameters to control here are the filter range, speed, and rq. Rq is set to 0.5, be subtle when changing this, remeber the way it effects volume. Mainly change speed which the the fraction inside the parenthesis



(
Ndef(\d).fadeTime = 30;
Ndef(\d, {
	var snd;
	snd = Pulse.ar(
		freq: [400, 407, 444, 463, 467, 501],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/8).range(20, 4000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\d).stop(30);
Ndef(\d).clear;

// run  and tweak as you please when i give the signal

(
Ndef(\low1).fadeTime = 30;
Ndef(\low1, {
	var snd;
	snd = SinOsc.ar(freq: 20, mul: 0.5) + LFPulse.ar(20, 0.5);
		snd = LPF.ar(snd, 200);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\low1).stop(10);
Ndef(\low1).clear;

//at the end eventually fade out second and third ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.
