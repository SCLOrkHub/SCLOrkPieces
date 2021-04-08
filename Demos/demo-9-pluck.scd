// Run again every few seconds, some params will get new random values each time
// Ndef.ar(\t) is a shared metronome across all computers, if you are in PUBLIC mode

(
Ndef(\wo).fadeTime = 4;
Ndef(\wo, {
	var snd, freqs;
	freqs = [440, 550] * Array.rand(4, 0.5, 1.5).round(0.25) * LFPulse.ar([1, 4, 5, 3]).range(1/2, 2);
	snd = Pluck.ar(
		in: WhiteNoise.ar,
		trig: Ndef.ar(\t),
		delaytime: freqs.reciprocal,
		decaytime: LFNoise0.ar(1/[2,3,4]).range(5, 9),
		coef: Array.rand(4, 0.05, 0.4)
	);
	snd = Splay.ar(snd); // make stereo now (NHHall expects stereo)
	snd = snd + (NHHall.ar(snd, 2, hiFreq: rrand(3000, 5000), hiRatio: 0.3) / rrand(6, 8));
	snd = Limiter.ar(snd);
}).play;
)

~bpm.(60); // this is how you control the bpm of the internal Ndef.ar(\t) shared by all
~bpm.(90);
~bpm.(120);