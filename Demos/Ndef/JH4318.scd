// Adapted from James Harkins
// https://scsynth.org/t/what-kind-of-synthesis-is-this/4318/18

b = Buffer.alloc(s, 16384, 1);

(
Ndef(\kernel, {
	var notes = [49, 54, 56, 59, 63, 65, 70, 73, 88] + rrand(-1, 5);
	// var harmonics = [1, 2, 3.5, 2, 4, 7];
	var harmonics = [1, 3.5, 4, 6, 8];
	var freqs = notes.midicps *.x harmonics *.x [1, 1.008];
	var exc = PinkNoise.ar * EnvGen.ar(Env.perc(0.001, 0.01));
	var sig = Klank.ar(`[freqs, 1 ! freqs.size, b.duration ! freqs.size], exc) * 0.05;
	RecordBuf.ar(sig, b, loop: 0);
	DelayC.ar(Impulse.ar(0));
})
)


(
Ndef(\JH4318).fadeTime = 1;
Ndef(\JH4318, {
	var snd;
	// var pulse = Dust.ar(LFDNoise3.kr(0.2).exprange(3, 15));
	var pulse = Impulse.ar(LFDNoise3.kr(0.2).exprange(2, 15));
	var excEg = Decay2.ar(pulse, 0.001, 0.02);
	var noise = PinkNoise.ar * excEg;
	var ffreq = LFDNoise3.kr(0.2).exprange(200, 10000);
	var frq = LFDNoise3.kr(0.12372).exprange(0.02, 0.4);

	noise = BLowPass4.ar(noise, ffreq, frq);

	snd = Convolution2.ar(
		in: noise,
		kernel: b,
		trigger: Ndef.ar(\kernel), // so it responds to a kernel change
		framesize: b.numFrames
	) * 0.1;
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)


