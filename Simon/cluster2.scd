//Just listen for the first while. Once I give you the green light, fade in. After fading in for the first time, eventually set the fadetime to 10-20. Then fluctuate in pitch by changing the frequencies. Move them subtly and stay within this range

//fade in manually with the k6
(
Ndef(\cluster2).fadeTime = 10;
Ndef(\cluster2, {
	var snd;
	snd = Pulse.ar(
		freq: [81, 81.02, 80.98, 82, 100],
		mul: 0.8
	);
	snd = LPF.ar(snd, 800);
	snd = Pan2.ar(Mix(snd), -0.7);
	snd = Limiter.ar(snd) * 0.3;
}).play;
)

Ndef(\cluster2).stop(60);
Ndef(\cluster2).clear;


// be super lowkey with this. Be soft, and barely noticeable. You Can vary all the delay lines, and vary every asperct of the filter. Go wild (but quiet).

(
Ndef(\high1).fadeTime = 10;
Ndef(\high1, {
	var snd;
	snd = Pulse.ar(
		freq: [800, 800.02, 799.98],
		mul: 0.4
	);
	snd = snd * Env.perc(0.1, 5, 1.0).ar;
	snd = LPF.ar(snd, 800);
	snd = CombC.ar(snd, 0.2, 0.05, 30);
	snd = BPF.ar(snd, SinOsc.ar([1/2, 1/3]).range(20, 1000), SinOsc.ar([1/12, 2, 1/4, 1]).range(0.02, 0.03));
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play
)
Ndef(\high1).stop(1);
Ndef(\high1).clear;

//at the end eventually fade out second ndef and return solely to the sine wave. We will end this way. Make sure to set a really long stop time.

(
Ndef(\h).fadeTime = 30;
Ndef(\h, {
	var snd;
	snd = Pulse.ar(
		freq: [83, 104, 105, 175, 145, 146],
		mul: 0.8
	);

	snd = BPF.ar(snd, SinOsc.ar(1/30).range(20, 2000), 0.5);
	snd = snd + CombC.ar(snd, 0.2, 0.05, 2, 0.5);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\h).stop(30);
Ndef(\h).clear;
