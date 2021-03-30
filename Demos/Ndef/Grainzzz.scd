// grainzzzz

(
Ndef(\br).fadeTime = 4;
Ndef(\br, {
	var snd, buffer;
	buffer = d.bev0; // assumes Dirt Samples is loaded
	// buffer = d.auto0;
	// NOTE: buffer must be a mono file (check Post window)
	buffer.numChannels.postln;
	snd = TGrains.ar(
		numChannels: 2,
		trigger: Impulse.ar(LFNoise0.ar(1).range(15, 55)),
		bufnum: buffer,
		rate: LFSaw.ar(1).range(1, 1.01),
		centerPos: 0.5 * BufDur.kr(buffer),
		dur: LFNoise2.kr(1/5).range(0.1, 0.5),
		pan: LFNoise0.kr(1),
		amp: LFNoise0.ar(4).range(0.1, 0.9)
	);
}).play;
)