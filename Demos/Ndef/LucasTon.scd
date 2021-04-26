// ++ code copied from lucas, April 21 2021
(
Ndef(\lucas, {
	arg freq1,freq2;
	var snd, snd1, snd2;
	freq1 = LFSaw.ar(0.4).range(29,30) * Rand(1, 15);
	freq2 = 50 * Rand(1, 15);
	snd1 = LFSaw.ar([
		freq1,
		freq1 + SinOsc.kr(0.5).range(0.1, 1.0),
		freq1 - Saw.kr(0.5).range(0.1, 1.0)
	]);
	snd2 = LFSaw.ar([
		freq2,
		freq2 + SinOsc.kr(0.7).range(0.1, 1.0),
		freq2 - LFTri.kr(0.7, 0.2).range(0.1, 1.0)
	]);
	snd1 = LPF.ar(snd1, SinOsc.kr(0.8).range(550, 800));
	snd2 = LPF.ar(snd2, SinOsc.kr(0.2).range(650, 1800));
	snd = snd1 + snd2 * 0.07; // volume
	snd = snd.distort.distort.distort;
	snd = BRF.ar(
		in: snd,
		freq: SinOsc.kr(0.5).range(200, 10000),
		rq: LFTri.kr(1).range(0.05, 0.8));
	snd = FreeVerb.ar(snd, 0.9);
	snd = Limiter.ar(snd);
}).play;
)