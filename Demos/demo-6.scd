
~bpm.(60);

(
var samples;
samples = [ \popkick4, \future10, \linnhats1, \sn47, \stomp4, \latibro3, \armora2, \speakspell6, \space4, \v3, \drumtraks10, \rave24, \sn4, \mute21, \notes4, \insect2 ];

Ndef(\b1).quant = 4;
Ndef(\b1, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pwhite(0.2, 0.7),
		\rate, Prand([1, 1, 0.9, 1.1], inf)
	)
).play
)

(
var samples;
samples = [\sax5, \sax6, \sax2, \sax1];

Ndef(\b2).quant = 4;
Ndef(\b2, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Prand(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pwhite(0.3, 0.5) / 2,
		\rate, Prand([1, 1, 0.999, 1.001], inf) * [1, 1.5, 20/8],
		\rate, Pkey(\rate) * Pstutter(8, Pseq([0, 7, 5], inf).midiratio)
	)
).play
)

(
Ndef(\xax).quant = 1;
Ndef(\xax).fadeTime = 4;
Ndef(\xax, {
	var in, snd;
	in = (Ndef(\b2).ar * 2) + Ndef(\b1).ar;
	snd = Decimator.ar(
		in: in,
		rate: SinOsc.ar(1/rrand(2, 5)).range(1000, 23000),
		bits: LFNoise0.ar(rrand(1/3, 2)).range(8, 10)
	);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.6
	);
	snd = LPF.ar(
		in: snd,
		freq: LFNoise0.ar(p.clock.tempo * 4).range(100, 6000)
	);
	snd = Pan2.ar(Mix.ar(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\b1).stop;
Ndef(\b2).stop;

Ndef(\b1).play; Ndef(\b2).play;











