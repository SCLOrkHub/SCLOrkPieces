// 2020-12-03


~bpm.(100)

(
var cycle;
cycle = [-10, 1, 3, 5];
Ndef(\sd, // customize name
	Pbind(
		\instrument, "organDonor",
		\degree, Pseq(cycle, inf),
		\dur, Pseq(~dursFrom.(cycle), inf),
		\stretch, 4,
		\amp, 0.2,
		\att, 0.001,
		\rel, 0.1,
		\legato, 0.1,
		\cutoff, Pwhite(500, 1700),
		\rq, Pwhite(0.1, 0.4)
	)
).play.quant_(4);
)

(
Ndef(\fx, {
	var snd;
	snd = Ndef(\sd).ar;
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: ~spb.() / 4, // echoes: beat divided by 4
		decaytime: 3 // 3 seconds tail
	);
	snd = Limiter.ar(snd);
}).play.quant_(4).fadeTime_(1);
)


(
Ndef(\fx, {
	var snd;
	snd = Ndef(\sd).ar;
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: ~spb.() / LFNoise0.kr(1).range(1, 4).round(1) ,
		decaytime: 3
	);
}).play.quant_(4).fadeTime_(0);
)

(
Ndef(\fx, {
	var snd;
	snd = Ndef(\sd).ar;
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: ~spb.() / LFNoise1.kr(1).range(1, 7).round(1), // try with smaller roundings
		decaytime: LFTri.ar(1/10).range(1, 4)
	);
}).play.quant_(4).fadeTime_(0);
)

