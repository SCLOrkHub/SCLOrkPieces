// Start out with your fadetime set to 60, after about 60 seconds, bring it down to anywhere between 10-20. At this point you will want to start changing pitch as you please. This will be changing the "freq" parameter. Stay within the range of the pitch. Listen to the sounds around you, you want to create beatings with yourself, and others. Thus change by small number (ex. 200-208).

// fade in manually with the k6
(
Ndef(\sine2).fadeTime = 7;
Ndef(\sine2, {
	var snd;
	snd = SinOsc.ar(
		freq: 100,
		mul: 0.4
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sine2).stop(30);
Ndef(\sine2).clear;


// You can change the frequencies if you want, but keep them within just a few of the original, (ex. 40 to 42).
//The main parameters to control here are the filter range, speed, and rq. Rq is set to 0.5, be subtle when changing this, remeber the way it effects volume. Mainly change speed which the the fraction inside the parenthesis


(
Ndef(\b).fadeTime = 30;
Ndef(\b, {
	var snd;
	snd = Pulse.ar(
		freq: [200, 212, 214, 403, 370, 301],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/40).range(20, 2000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\b).stop(30);
Ndef(\b).clear;

//run this one as well when and tweak as you please i give the signal, and tweak as you please

(
Ndef(\white2).fadeTime = 30;
Ndef(\white2, {
	var snd;
	snd = PinkNoise.ar(
		freq: 440,
		mul: 0.2
	);
	snd = BPF.ar(
		in: snd,
		freq: SinOsc.ar(4).range(200, 1200),
		rq: 0.8
	);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1.0,
		delaytime: 0.1,
		decaytime: 3
	);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.6,
		room: 0.6
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\white2).stop(30);
Ndef(\white2).clear;

//at the end eventually fade out second and third ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.
