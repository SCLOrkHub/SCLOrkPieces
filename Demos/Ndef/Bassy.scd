// From July 2021

(
// remember to change name!!!!!!!!!!!!!
Ndef(\bassy).fadeTime = 0;
Ndef(\bassy, {
	var snd = SinOsc.ar(
		freq: 43
		* [4, XLine.ar(1, 0.5, 10)]
		* Array.rand(16, 0.99, 1.01), // choose harmonic from 1 to 32
		mul: 0.14 * LFTri.ar(SinOsc.ar(1/5).range(1, 5))
		* SinOsc.ar(1/5).range(0.15, 1)// volume
	);
	snd = Pan2.ar(in: Mix(snd), pos: LFNoise2.ar(1).range(-0.5, 0.5));
	snd = (snd.distort.distort.distort.tanh * 2).clip(-0.1, 0.1) / 1;
	// snd = RHPF.ar(snd, XLine.ar(43, 43*7, 1), 0.2);
	snd = FreeVerb.ar(snd, 0.4, 0.7);
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
)
