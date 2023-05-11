//Just listen for the first while. Once I give you the green light, fade in. After fading in for the first time, eventually set the fadetime to 10-20. Then fluctuate in pitch by changing the speed of the paning. Move them subtly and stay within this range. You can change pitch subtly as well

//dont be too loud. Blend in while being distinct.

(
Ndef(\cluster4).fadeTime = 60;
Ndef(\cluster4, {
	var snd;
	snd = Pulse.ar(
		freq: [236, 235.98, 236.01],
		mul: 0.8
	);
	snd = LPF.ar(snd, 1500);
	snd = Pan2.ar(Mix(snd), SinOsc.ar(8).range(-1, 1));
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\cluster4).stop(60);
Ndef(\cluster4).clear;


//when I give the command, bring in this sound. You can play with frequency rate (where the 12 is, and substitue for different speeds. Be very subtle, not too loud.


(
Ndef(\white1).fadeTime = 30;
Ndef(\white1, {
	var snd;
	snd = WhiteNoise.ar(
		freq: 440,
		mul: 0.2
	);
	snd = BPF.ar(
		in: snd,
		freq: SinOsc.ar(12).range(200, 1200),
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
Ndef(\white1).stop(30);
Ndef(\white1).clear;



//at the end eventually fade out cluster  and white ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.

(
Ndef(\j).fadeTime = 30;
Ndef(\j, {
	var snd;
	snd = Pulse.ar(
		freq: [20, 24, 28, 29, 43, 52],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/4).range(20, 2000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\j).stop(30);
Ndef(\j).clear;