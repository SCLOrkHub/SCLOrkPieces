//Just listen for the first while. Once I give you the green light, fade in. After fading in for the first time, eventually set the fadetime to 10-20. Then fluctuate in pitch by changing the frequencies. Move them subtly and stay within this range

// fade in manually with the k6
(
Ndef(\cluster3).fadeTime = 10;
Ndef(\cluster3, {
	var snd;
	snd = Pulse.ar(
		freq: [201, 202, 346],
		mul: 0.8
	);
	snd = LPF.ar(snd, 1500);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\cluster3).stop(60);
Ndef(\cluster3).clear;

// be super lowkey with this. Be soft, and barely noticeable. You Can vary all the delay lines, and vary every asperct of the filter. Go wild (but quiet).

(
Ndef(\high2).fadeTime = 10;
Ndef(\high2, {
	var snd;
	snd = Pulse.ar(
		freq: [700, 700.02, 699.98],
		mul: 0.4
	);
	snd = snd * Env.perc(0.1, 2, 1.0).ar;
	snd = LPF.ar(snd, 800);
	snd = CombC.ar(snd, 0.2, 0.05, 30);
	snd = BPF.ar(snd, SinOsc.ar([1/4, 1/6]).range(20, 800), SinOsc.ar([1/8, 1/4]).range(0.02, 0.03));
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play
)
Ndef(\high2).stop(1);
Ndef(\high2).clear;

//at the end eventually fade out other and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.

(
Ndef(\i).fadeTime = 30;
Ndef(\i, {
	var snd;
	snd = Pulse.ar(
		freq: [567, 568, 564, 601, 663, 632],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/60).range(20, 2000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\i).stop(30);
Ndef(\i).clear;