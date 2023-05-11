
// Load Samples first


// ~bpm.(155)

(
Ndef(\dm).quant = 12;
Ndef(\dm).fadeTime = 0;
Ndef(\dm, {
	var snd, note, intervals;
	intervals = [ 0, 3, 7, 12, 14, 15 ];
	note = Select.kr(
		which: MouseX.kr(0, intervals.size).round(1),
		array: intervals
	);

	// D is 26, 38, 50, etc
	note = 26 + note;
	snd = LFTri.ar(
		freq: note.midicps * 2 * Array.rand(6, 0.99, 1.01),
		mul: \amp.kr(1).lag * MouseY.kr(0.01, 0.5)
	);
	snd = Clip.ar(snd*10, 0.15.neg, 0.15);
	snd = LPF.ar(snd, LFNoise2.ar(1/4).range(3000, 9000)).tanh;
	snd = FreeVerb.ar(snd, 0.3, 0.5, 0.8);
	snd = Pan2.ar(Mix(snd));
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\dm).stop(4)

(
Ndef(\dmControl,
	Pbind(
		\type, \set,
		\id, Ndef(\dm).nodeID,
		\amp, Pseq([0.5, 0.1], inf),
		\dur, 1/4
	)
).play;
)

Ndef(\dmControl).clear(3)


