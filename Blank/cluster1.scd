//Just listen for the first while. Once I give you the green light, fade in. After fading in for the first time, eventually set the fadetime to 10-20. Then fluctuate in pitch by changing the frequencies. Move them subtly and stay within this range

(
Ndef(\cluster1).fadeTime = 60;
Ndef(\cluster1, {
	var snd;
	snd = Pulse.ar(
		freq: [40, 42, 62],
		mul: 0.8,
	);
	snd = LPF.ar(snd, 1000);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\cluster1).stop(60);
Ndef(\cluster1).clear;


// You can change the frequencies if you want, but keep them below 45. Try to move slowly and by small increments.

(
Ndef(\low3).fadeTime = 30;
Ndef(\low3, {
	var snd;
	snd = SinOsc.ar(freq: 20, mul: 0.5) + LFPulse.ar(20, 0.5);
		snd = LPF.ar(snd, 200);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\low3).stop(10);
Ndef(\low3).clear;

//at the end eventually fade out second ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.

(
Ndef(\g).fadeTime = 30;
Ndef(\g, {
	var snd;
	snd = Pulse.ar(
		freq: [201, 215, 223, 398, 370, 304],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/10).range(20, 2000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\g).stop(30);
Ndef(\g).clear;