(
// press A to make a sound
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var env = Env.asr(
		attackTime: 0.1, // attack
		releaseTime: ~wiiB.kr.linlin(0, 1, 0, 10).poll, // release
		curve: -1 // concave or convex shape
	).kr(gate: ~wiiA.kr);
	var midinotes = [ Dseq([60,67,69,67,69,67,69,65,67, 69, 65, 53, 60], inf).midicps ,
		Dseq([67,69,67,69,65,67, 69, 65, 53, 60,60,67,69,], inf).midicps,
		Dseq([69,67,69,67,69,65,67, 69, 65, 53, 60,60,67,], inf).midicps
	];
	var trigger = Impulse.kr(4);
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: Demand.kr(trigger, 0, midinotes) * [1, 1.001, 2] * 0.95,
		mul: 0.1,
	);
	snd = LPF.ar(snd, SinOsc.ar(~wiiX.kr.range(1, 12)).range(20, 4000));
	snd = snd * env * ~wiiY.kr.range(0, 3);
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)