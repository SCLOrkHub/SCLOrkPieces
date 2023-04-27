// Start out with your fadetime set to 60, after about 60 seconds, bring it down to anywhere between 10-20. At this point you will want to start changing pitch as you please. This will be changing the "freq" parameter. Stay within the range of the pitch. Listen to the sounds around you, you want to create beatings with yourself, and others. Thus change by small number (ex. 430-427).

(
Ndef(\sine5).fadeTime = 60;
Ndef(\sine5, {
	var snd;
	snd = SinOsc.ar(
		freq: 430,
		mul: 0.8
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sine5).stop(30);
Ndef(\sine5).clear;

// You can change the frequencies if you want, but keep them below 40. Try to move slowly and by small increments.


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

//at the end eventually fade out second ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.