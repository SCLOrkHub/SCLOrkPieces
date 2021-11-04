(
// REMEMBER TO CHANGE NDEF NAME
// ~mySample = d.cp0;
~mySample = d.baa1;
Ndef(\goat).fadeTime = 0;
Ndef(\goat, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~mySample.numChannels,
		bufnum: ~mySample,
		rate: 1.0
		* BufRateScale.kr(~mySample),
		trigger: Impulse.kr(0),
		startPos: LFNoise0.ar(5).range(0, 0.5)
		* BufSamples.kr(~mySample),
		loop: 1
	);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd) * 0.1;
}).play;
)

Ndef(\goat).stop(3);