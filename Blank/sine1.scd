// Start out with your fadetime set to 60, after about 60 seconds, bring it down to anywhere between 10-20. At this point you will want to start changing pitch as you please. This will be changing the "freq" parameter. Stay within the range of the pitch. Listen to the sounds around you, you want to create beatings with yourself, and others. Thus change by small number (ex. 140-142).


(
Ndef(\sine1).fadeTime = 60;
Ndef(\sine1, {
	var snd;
	snd = SinOsc.ar(
		freq: 140,
		mul: 1.0
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sine1).stop(60);
Ndef(\sine1).clear;


// You can change the frequencies if you want, but keep them within just a few of the original, (ex. 40 to 42).
//The main parameters to control here are the filter range, speed, and rq. Rq is set to 0.5, be subtle when changing this, remeber the way it effects volume. Mainly change speed which the the fraction inside the parenthesis


(
Ndef(\a).fadeTime = 30;
Ndef(\a, {
	var snd;
	snd = Pulse.ar(
		freq: [40, 42, 60, 81, 82, 100],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/4).range(20, 2000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\a).stop(30);
Ndef(\a).clear;