// Start out with your fadetime set to 60, after about 60 seconds, bring it down to anywhere between 10-20. At this point you will want to start changing pitch as you please. This will be changing the "freq" parameter. Stay within the range of the pitch. Listen to the sounds around you, you want to create beatings with yourself, and others. Thus change by small number (ex. 430-427).

(
Ndef(\sine6).fadeTime = 60;
Ndef(\sine6, {
	var snd;
	snd = SinOsc.ar(
		freq: 370,
		mul: 0.8
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sine6).stop(30);
Ndef(\sine6).clear;


// You can change the frequencies if you want, but keep them below 45. Try to move slowly and by small increments.


(
Ndef(\low2).fadeTime = 30;
Ndef(\low2, {
	var snd;
	snd = SinOsc.ar(freq: 22, mul: 0.5) + LFPulse.ar(20, 0.5);
		snd = LPF.ar(snd, 200);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\low2).stop(30);
Ndef(\low2).clear;

//at the end eventually fade out second ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.