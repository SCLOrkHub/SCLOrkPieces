(
// example:
// A to make sound
// B to add reverb
// X axis for harmonics
// Y axis for volume

Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = SinOsc.ar(
		freq: 43 * ~wiiX.kr.range(2, 9).round(1.0), // choose your range
		mul: ~wiiA.kr * ~wiiY.kr.range(0, 1) // volume
	);
	snd = Mix.ar(snd);
	snd = Select.ar(
		which: ~wiiB.kr,
		array: [
			FreeVerb.ar(snd, 0.1, 0.4, 0.5), // just a little reverb
			FreeVerb.ar(snd, 0.5, 0.9, 0.7) // a lot of reverb
		];
	);
	snd = Limiter.ar(snd);
}).play;
)