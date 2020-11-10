//
// demo-5
//

(
var degrees;
degrees = [
	[0, \r, \r, 0],
	\r,
	\r,
	[\r, -7, 2b, \r]
];
Ndef(\name).quant = 4;
Ndef(\name, // customize name
	Pbind(
		\instrument, "subBass2" ,
		\scale, Scale.major,
		\degree, Pseq(degrees.flat, inf),
		\dur, Pseq(~dursFrom.(degrees), inf),
		\stretch, 4,
		\ctranspose, [-24, -12] + Pstutter(degrees.flat.size, Pseq([0, -4], inf)),
		\amp, Pwhite(0.2, 0.4),
		\att, 0.001,
		\rel, 1,
	)
).play;
)


(
Ndef(\har).quant = 4;
Ndef(\har,
	Pbind(
		\instrument, "apadMH",
		\degree, Pseq([
			[0, 2b, 4, 6b],
			[0, 2b, 4s, 7],
			[-4, 1, 2b, 7],
			[-6, -3, 0, 3],
		], inf),
		\ctranspose, [0, 12],
		\dur, 4,
		\amp, Pwhite(0.05, 0.09) * [1, 0.15],
		\att, 0.001,
		\rel, Pwhite(1, 2.0),
	)
).play;
)

(
var samples;
samples = [\bd0, \r, \bd0, \lt4];
// samples = [\bd0, \r, \bd0, [\lt4, \r, \r, \lt3]];
samples = [\bd0, \bd1, \bd0, \lt4!2];
// samples = [\bd0!2, \r, \bd0, \lt1!3];
// samples = [\bd0!2, \r, \bd0, \lt1!3, [ \hc2, \popkick7, \tabla17, \can9 ]];


Ndef(\dr).quant = 4; // customize name
Ndef(\dr, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 0.4,
		\rate, 1
	)
).play
)

(
var samples;
samples = [\hh0, \hh0, \hh0!3, \hh0!4, \hh0!2, \hh0!8, \hh0, \hh4];


Ndef(\hh).quant = 4; // customize name
Ndef(\hh, // customize name
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pwhite(0.2, 0.7),
		\rate, Pstutter(8, Pwhite(1, 1.1)),
		\pan, Pwhite(-1, 1.0)
	)
).play
)

(
Ndef(\fx).fadeTime = 4;
Ndef(\fx, {
	var snd, env;
	snd = Ndef(\har).ar + Ndef(\dr).ar + Ndef(\hh).ar + Ndef(\name).ar;
	snd = Decimator.ar(
		in: snd,
		rate: LFNoise1.ar(1.1).range(6000, 23000),
		bits: LFNoise2.ar(1).range(6, 11),
	);
	snd = snd.distort.tanh;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.3,
		room: 0.5,
		damp: 0.6
	);
	snd = Pan2.ar(Mix(snd), 0) * Ndef(\fxAmp, 1).kr
}).play;
)


Ndef(\fxAmp, { SinOsc.kr(MouseY.kr(5, 10)).range(0, 1) });
Ndef(\fxAmp, { LFPulse.kr(MouseY.kr(10, 39)).range(0.5, 4) });
Ndef(\fxAmp, 0).quant_(4);

Ndef(\fx).xset(\amp, 1);