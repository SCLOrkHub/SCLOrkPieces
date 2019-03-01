(
Ndef(\a, {
	var harmonic, harmonic2, snd;
	harmonic = LFTri.ar(LFSaw.ar(1));
	harmonic2 = SinOsc.ar(1) * 10;
	snd = SinOsc.ar(
		freq: 43 * [
			harmonic * 4,
			harmonic * 8 * SinOsc.ar(2),
			SinOsc.ar(2).range(0, 2).round(1)
		],
		mul: SinOsc.ar(
			SinOsc.ar(
				SinOsc.ar(
					SinOsc.ar(
						SinOsc.ar(
							SinOsc.ar(
								SinOsc.ar(
									SinOsc.ar(
										SinOsc.ar(4)
									)
								)
							)
						)
					)
				)
			)
		).range(0.0, 2)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)