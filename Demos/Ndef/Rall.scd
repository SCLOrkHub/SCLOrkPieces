(
Ndef(\a, {
	var line = XLine.ar(start: 150, end: 2, dur: 6);
	var pulse = LFPulse.ar(freq: line, width: 0.2);
	var snd = WhiteNoise.ar(mul: pulse);
	snd = HPF.ar( // try LPF instead
		in: snd,
		freq: XLine.ar(15000, 260, 5)
	);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.8
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)



