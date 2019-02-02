//////////////////////////////
// Sandstrom SynthDefs
//////////////////////////////

s.waitForBoot({

SynthDef("risset", { arg freq = 400, amp = 0.5, ringTime = 9, pan = 0, att = 1;
	var amps = #[1, 0.67, 1, 1.8, 2.67, 1.67, 1.46, 1.33, 1.33, 1, 1.33];
	var durs = #[1, 0.9, 0.65, 0.55, 0.325, 0.35, 0.25, 0.2, 0.15, 0.1, 0.075];
	var frqs = #[0.56, 0.56, 0.92, 0.92, 1.19, 1.7, 2, 2.74, 3, 3.76, 4.07];
	var dets = #[0, 1, 0, 1.7, 0, 0, 0, 0, 0, 0, 0];
	var snd = Mix.fill(11, {|i|
		var env = EnvGen.ar(Env.perc(att, ringTime*durs[i], amps[i], -4.5));
		SinOsc.ar(freq*frqs[i]+dets[i], 0, amp*env);
	});
	var bigEnv = EnvGen.ar(Env.linen(0.005, ringTime, 0.1), doneAction: 2);
	snd = snd * bigEnv * 0.1;
	Out.ar(0, Pan2.ar(snd, pan));
}).add;

// intro: used for player-controlled bells which play notes from the score
SynthDef("wikiBell", { arg freq = 400, amp = 0.5, ringTime = 9, pan = 0;
	var amps = #[1, 0.67, 1, 1.8, 2.67, 1.67, 1.46, 1.33, 1.33, 1, 1.33, 1];
	var durs = #[1, 0.9, 0.65, 0.55, 0.325, 0.35, 0.25, 0.2, 0.15, 0.1, 0.075, 0.15];
	var frqs = #[0.5, 1, 1.183, 1.506, 2, 2.514, 2.662, 3.011, 4.166, 5.433, 6.796, 8.215];
	var dets = #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	var snd = Mix.fill(12, {|i|
		var env = EnvGen.ar(Env.perc(0.005, ringTime*durs[i], amps[i], -4.5));
		SinOsc.ar(freq*frqs[i]+dets[i], 0, amp*env);
	});
	var bigEnv = EnvGen.ar(Env.linen(0.005, ringTime, 0.1), doneAction: 2);
	snd = snd * bigEnv * 0.1;
	Out.ar(0, Pan2.ar(snd, pan));
}).add;

// used for bells intro (Pbinds)
SynthDef("wikiBell2", { arg freq = 400, amp = 0.5, ringTime = 10, pan = 0, att = 1;
	var amps = #[1, 0.67, 1, 1.8, 2.67, 1.67, 1.46, 1.33, 1.33, 1, 1.33, 1];
	var durs = #[1, 0.9, 0.65, 0.55, 0.325, 0.35, 0.25, 0.2, 0.15, 0.1, 0.075, 0.15];
	var frqs = #[0.5, 1, 1.83, 1.506, 2, 2.514, 2.662, 3.011, 4.166, 5.433, 6.796, 8.215];
	var dets = #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	var snd = Mix.fill(12, {|i|
		var env = EnvGen.ar(Env.perc(att, ringTime*durs[i], amps[i], -4.5));
		SinOsc.ar(freq*frqs[i]+dets[i], 0, amp*env);
	});
	var bigEnv = EnvGen.ar(Env.linen(0.005, ringTime, 0.1), doneAction: 2);
	snd = snd * bigEnv * 0.1;
	Out.ar(0, Pan2.ar(snd, pan));
}).add;

// used for attack-less bells at intro fade out (less pronounced high partials)
SynthDef("wikiBell3", { arg freq = 400, amp = 0.5, ringTime = 10, pan = 0, att = 1;
	var amps = #[1, 0.78, 1, 1.8, 2.67, 1.67, 0.46, 0.33, 0.33, 0.1, 0.53, 0.06];
	var durs = #[1, 0.9, 0.65, 0.55, 0.325, 0.35, 0.25, 0.2, 0.15, 0.1, 0.075, 0.15];
	var frqs = #[0.5, 1, 1.26, 1.506, 2, 2.514, 2.662, 3.011, 4.166, 5.433, 6.796, 8.215];
	var dets = SinOsc.kr(7).range(0.995, 1.005) ! 12;
	var snd = Mix.fill(12, {|i|
		var env = EnvGen.ar(Env.perc(att, ringTime*durs[i], amps[i], -4.5));
		SinOsc.ar(freq*frqs[i]*dets[i], 0, amp*env);
	});
	var bigEnv = EnvGen.ar(Env.linen(0.005, ringTime, 0.1), doneAction: 2);
	snd = snd * bigEnv * 0.1;
	Out.ar(0, Pan2.ar(snd, pan));
}).add;

SynthDef("sine1", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, snd, env;
	freq = {midinote.midicps * LFNoise2.kr(1,0.02,1)}!24;
	env = EnvGen.kr(Env.asr(0.1, 1, 2.5), gate, doneAction: 2);
	snd = Mix(SinOsc.ar(freq: Lag.kr(freq), mul: amp * env)) * 0.5;
	Out.ar(0, snd!2);
}).add;

// this one piles up harmonics (gets thick and brigh and noisy)
SynthDef("sine2", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, snd, env, arp;
	freq = {midinote.midicps * LFNoise2.kr(1,0.02,1)}!24;
	env = EnvGen.kr(Env.asr(0.5, 1, 2.5), gate, doneAction: 2);
	snd = SinOsc.ar(freq: Lag.kr(freq), mul: amp) * 0.5;
	arp = Blip.ar(freq: freq, numharm: Line.kr(1, 50, Rand(20, 40)), mul: 0.1);
	snd = (snd + arp) * env;
	Out.ar(0, Splay.ar(snd));
}).add;

// wiimote x axis controls number of harmonics
// harmonics' attack and release are "rough"
SynthDef("sine3", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, snd, env, arp, harms;
	freq = {midinote.midicps * LFNoise2.kr(1,0.02,1)}!24;
	env = EnvGen.kr(Env.asr(0.5, 1, 2.5), gate, doneAction: 2);
	snd = SinOsc.ar(freq: Lag.kr(freq), mul: amp) * 0.5;

	harms = Lag.kr((In.kr(~wiiXbus) * 10 + 1), 1);
	arp = Blip.ar(freq: freq, numharm: harms, mul: 0.06);
	snd = (snd + arp) * env;
	Out.ar(0, Splay.ar(snd));
}).add;

// a little more "synthy"
// wiimote x axis controls spectrum richness (filter frequency)
SynthDef("sine4", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, snd, env, ffreq;
	freq = {midinote.midicps * LFNoise2.kr(1,0.02,1)}!24;
	env = EnvGen.kr(Env.asr(0.5, 1, 2.5), gate, doneAction: 2);
	snd = Saw.ar(freq: Lag.kr(freq), mul: amp) * 0.5;
	ffreq = Lag.kr((2000 * In.kr(~wiiXbus) + (midinote.midicps * 1.5)), 1);
	snd = LPF.ar(in: snd, freq: ffreq);
	snd = snd * env;
	Out.ar(0, Splay.ar(snd));
}).add;

// a mix between sine1 (simple) and a filtered Blip
// wiimote x axis controls mix
SynthDef("sine5", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, snd1, snd2, mix, env, ffreq;
	freq = {midinote.midicps * LFNoise2.kr(1,0.02,1)}!24;
	env = EnvGen.kr(Env.asr(1.5, 1, 2.5), gate, doneAction: 2);
	ffreq = Lag.kr((2000 * In.kr(~wiiXbus)), 1);
	snd1 = Blip.ar(freq: Lag.kr(freq), numharm: 4, mul: amp);
	snd1 = Mix(LPF.ar(in: snd1, freq: ffreq));
	snd2 = Mix(SinOsc.ar(freq: Lag.kr(freq), mul: amp));
	mix = SelectX.ar(In.kr(~wiiXbus), [snd2, snd1]) * env * 0.1;
	Out.ar(0, mix!2);
}).add;

// variation using shaper
SynthDef("sine6", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, transFunc, dist, snd1, snd2, mix, env, ffreq;
	freq = {midinote.midicps * LFNoise1.kr(1,0.04,1)}!24;
	env = EnvGen.kr(Env.asr(1.5, 1, 2.5), gate, doneAction: 2);
	transFunc = Buffer.alloc(s, 1024, 1, { |buf| buf.chebyMsg([1,0.2,0,0.1,0.3,1,0.1,0.1,1,0.1,0.4,0,1]) });
	dist = Lag.kr((In.kr(~wiiXbus)), 1);
	snd1 = Shaper.ar(transFunc, SinOsc.ar(freq, 0, dist));
	snd1 = Mix(snd1);
	Out.ar(0, snd1!2);
}).add;

// sounds bad
SynthDef("sine7", {arg midinote = 60, amp = 0.2, gate = 1;
	var freq, snd, mix, ffreq, env,
	fr = #[ 400, 750, 2400, 2600, 2900 ],
	am = #[ 1, 0.28183829312645, 0.089125093813375, 0.1, 0.01 ],
	qu = #[ 0.1, 0.10666666666667, 0.041666666666667,
		0.046153846153846, 0.041379310344828 ];

	freq = {midinote.midicps * LFNoise1.kr(1,0.04,1)}!24;
	env = EnvGen.kr(Env.asr(1.5, 1, 2.5), gate, doneAction: 2);
	snd = Blip.ar(freq: Lag.kr(freq), numharm: 4, mul: amp);
	snd = BBandPass.ar(snd, fr, qu) * amp;

	ffreq = Lag.kr((2000 * In.kr(~wiiXbus)), 1);
	mix = LPF.ar(in: Mix(snd), freq: ffreq) * 0.1;

	Out.ar(0, mix!2);
}).add;

// Master Out (Wiimote y axis controlled)
SynthDef("masterOut", {
	var wii = Lag.kr( Clip.kr(In.kr(~wiiYbus)), 1 );
	ReplaceOut.ar(0, In.ar(0, 2) * wii);
}).add;

"SynthDefs loaded".postln;
" ".postln;

}); // end of waitForBoot
