
~legua = Buffer.read(s, Quarks.folder ++ "/SCLOrkPieces/Samples/legua-short.wav");

12 / ~legua.duration * 60;


~bpm.(155);

Ndef.clear;

(
Ndef(\shaker).quant = ~legua.duration;
Ndef(\shaker).fadeTime = 0;
Ndef(\shaker, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: ~legua,
		rate: 1, //~legua.duration / 4,
		// trigger: Impulse.kr(5),
		loop: 1

	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\shaker).stop(10);



(
Ndef(\dm).quant = ~legua.duration;
Ndef(\dm).fadeTime = 3;
Ndef(\dm, {
	var snd, note;
	note = Select.kr(MouseY.kr(0, 3), [ 62, 65, 69 ]);
	// D is 26, 38, 50, 62, etc
	// F is 29, 41, 53, 65, etc
	// A is 33, 45, 57, 69, etc
	snd = LFTri.ar(
		freq: note.midicps * 2 * Array.rand(6, 0.99, 1.01),
		mul: LFPulse.ar(LFNoise2.ar(3).range(5, 10)).range(0.1, 0.4)
	);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play.quant_(~legua.duration);
)