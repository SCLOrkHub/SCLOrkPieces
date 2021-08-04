// from July 2021

(
// remember to change name!!!!!!!!!!!!!
Ndef(\bruno).fadeTime = 3;
Ndef(\bruno, {
	var snd = SinOsc.ar(
		freq: 43
		* [3, XLine.ar(1, 0.25, 30)]
		* LFPulse.ar(1/LFNoise0.ar(1/8).range(3, 8)).range(14, 21)
		* Array.rand(16, 0.99, 1.01), // choose harmonic from 1 to 32
		mul: 0.014 * LFPulse.ar(SinOsc.ar(1/3).range(1, 5), 0, LFTri.ar(2).range(0.2, 0.7))
		* SinOsc.ar(1/5).range(0, 1)// volume
	);
	snd = Pan2.ar(in: Mix(snd), pos: LFNoise2.ar(1).range(-0.5, 0.5));
	snd = snd + (LocalIn.ar(2) * 0.5);
	snd = (snd.distort.distort.distort.tanh * 10).clip(-0.5, 0.5) / 2;
	snd = snd + (NHHall.ar(snd, 4) * 0.4);
	snd = Limiter.ar(snd) * 1; // another master volume control
	LocalOut.ar(PitchShift.ar(snd, 0.2, 0.5) * 0.4);
	snd = BPF.ar(snd, LFNoise2.ar(1/4).range(100, 5000), 0.2);
}).play;
)