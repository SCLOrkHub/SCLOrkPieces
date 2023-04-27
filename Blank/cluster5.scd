//Just listen for the first while. Once I give you the green light, fade in. After fading in for the first time, eventually set the fadetime to 10-20. Then fluctuate in pitch by changing the speed of the paning. Move them subtly and stay within this range. You can change pitch subtly as well


//dont be too loud. Blend in while being distinct.

(
Ndef(\cluster5).fadeTime = 60;
Ndef(\cluster5, {
	var snd;
	snd = Pulse.ar(
		freq: [200, 340, 347, 380, 410, 411],
		mul: 0.8
	);
	snd = LPF.ar(snd, 1500);
	snd = Pan2.ar(Mix(snd), SinOsc.ar(30).range(-1, 1));
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\cluster5).stop(60);
Ndef(\cluster5).clear;



//when I give the command, bring in this sound. You can play with frequency rate (where the 12 is, and substitue for different speeds. Be very subtle, not too loud

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



//at the end eventually fade out cluster and white ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.

(
Ndef(\k).fadeTime = 30;
Ndef(\k, {
	var snd;
	snd = Pulse.ar(
		freq: [20, 24, 28, 29, 43, 52],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/12).range(20, 1000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\k).stop(30);
Ndef(\k).clear;