

// ++ code copied from bruno
(
// remember to change name
Ndef(\bruno).fadeTime = 10;
Ndef(\bruno, {
	var snd = SinOsc.ar(
		freq: 43 * [1, 5], // choose harmonic from 1 to 32
		mul: 0.05 // volume
	);
	snd = Splay.ar(snd);
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
)
// -- end of copied code
