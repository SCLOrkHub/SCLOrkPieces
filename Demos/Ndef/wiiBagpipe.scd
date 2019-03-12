(// ++ code copied from Josh
Ndef("pipes", {arg freq = 43, slope = 0.2, fade = 0.4, distance = 0.1, wdepth = 1.03, wtime = 0.15, wdec = 0.01, wspeed = 10;
	var pipea, pipeb, pipec, air, envair, enva, envb, envc, mix, melpipe, wobble, envwobble, trigger, wiipitch, bag;
	wiipitch = ~wiiX.kr.range(3, 9).round(1);
	trigger = Trig1.kr(
        in: abs(wiipitch - Delay1.kr(wiipitch)),
        dur: 0.001
    );
	bag = Trig1.kr(
        in: abs(~wiiB.kr - Delay1.kr(~wiiB)),
        dur: 0.001
    );
	envwobble = Env.pairs([[0, 1], [0.001, wdepth],  [wtime, wdepth], [wdec, 1]], -2).kr(gate: trigger);
	wobble = LFPulse.ar(freq: wspeed).range(1/envwobble, envwobble);
	melpipe = Saw.ar(freq: (freq * wobble * 4 * LFNoise2.kr([1, 1/3]).range(0.997, 1.003) * wiipitch), mul: 1/2);
	melpipe = melpipe + Pulse.ar(freq: (freq * wobble * 4 * LFNoise2.kr([1/2, 1/5]).range(0.997, 1.003) * wiipitch), width: 1/3, mul: 1/2);
	melpipe = HPF.ar(in: melpipe, freq: freq * 3, mul: 1/2) + HPF.ar(in: melpipe, freq: freq * 2, mul: 0.5);
	melpipe = LPF.ar(in: melpipe, freq: 13000, mul: ~wiiA.kr.lag(1));
	enva = Line.ar(start: 2 - (distance + 0.1), end: 2, dur: fade * 1);
	envb = Line.ar(start: 3 - (distance), end: 3, dur: fade * 0.9);
	envc = Line.ar(start: 4 - (distance + 0.05), end: 4, dur: fade * 1.1);
	pipea = Saw.ar(freq: freq * enva * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.99, 1.01), mul: enva/2);
	pipea = pipea + Pulse.ar(freq: freq * enva * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.98, 1.02), width: 1/3, mul: enva/2);
	pipeb = Saw.ar(freq: freq * envb * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.99, 1.01), mul: envb/2);
	pipeb = pipeb + Pulse.ar(freq: freq * envb * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.985, 1.015), width: 1/3, mul: envb/2);
	pipec = Saw.ar(freq: freq * envc * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.992, 1.008), mul: envc/2);
	pipec = pipec + Pulse.ar(freq: freq * envc * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.98, 1.02), width: 1/3, mul: envc/2);
	air = BPF.ar(in: PinkNoise.ar(mul: 1), freq: ([(freq * enva) + (freq * envb) + (freq * envc)] * LFNoise2.kr(0.2).range(1.9, 2.1)), rq: 0.5, mul: LFNoise2.kr(1).range(0.5, 1)) + BPF.ar(in: PinkNoise.ar(mul: 1), freq: freq * 2, rq: 0.3, mul: 1);
	mix = LPF.ar(in: (pipea + HPF.ar(pipeb, freq * 2) + HPF.ar(pipec, freq * 3) + air), freq: 10000, mul: 0.25 * ~wiiB.kr.lag(6));
	mix = (mix + melpipe);
	mix = Limiter.ar(mix);
}).play;
)

// -- end of copied code
