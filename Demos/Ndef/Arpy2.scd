// requires Dirt Samples
(
// ~mySample = d.trump1;
~mySample = d.arpy2;
Ndef(\tpt).fadeTime = 2;
Ndef(\tpt, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~mySample.numChannels, // don't change this line
		bufnum: ~mySample, // don't change this line
		rate: LFPulse.ar([7, 2, 1]).range(1, [0.25, 0.5]) * [0.75, 0.8, 1]
		* XLine.ar(2, 1, 15).round([0.2, 0.25].choose)
		* BufRateScale.kr(~mySample), // don't change this line
		trigger: Impulse.kr(Line.ar(1, 1/8, 15)),
		startPos:
		LFNoise0.ar(2).range(0, 0.9)
		* BufSamples.kr(~mySample), // don't change this line
		loop: 1
	);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: [0.23, 0.9, 0.8],
		decaytime: [3, 2, 8]
	);
	snd = Splay.ar(snd);
	snd = snd
	+ (0.4 * NHHall.ar(
		in: snd,
		rt60: 5,
	));
	snd = Limiter.ar(snd) * XLine.ar(0.5, 0.01, 30);
}).play;
)

Ndef(\tpt).stop(4);
