//
// 20x20 JOSH STARTER CODE
//
// rule of thumb: always close this tab after playing the piece;
// then open a fresh new one to play again (red button "Load New Piece > 20x20")

/*
Info:

Every time you click on red button "Load New Piece" and select "20x20", a new tab will open with a COPY of the contents of your personal starter file. You should live code on that newly open tab. This way you don't have to worry about ever messing up with the starter code, saving unwanted updates, etc.

If you ever need to make actual changes to the starter code, send your new starter file to Bruno to incorporate directly on GitHub, then next time you hit "Update SCLOrk" you will get the latest.

You can also request a change directly through the GitHub interface on your browser: log in to your account, open your file there: https://github.com/SCLOrkHub/SCLOrkPieces/tree/master/20x20 - click the little pen button to edit, make your modifications, then submit as a pull request (Bruno will have to approve before changes take effect in main repository).


DO NOT SAVE THIS TAB

*/

// ==================================================
// 1:30 or 2:41 - Untested with group
// ==================================================

(
var samples, amples;
samples = [\bottle0, \can1, \bottle2, \can3, \bottle4, \can5, \bottle6, \can7].scramble;
amples = [1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0];

Ndef(\joshKlink).quant = 4;
Ndef(\joshKlink,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4, // loop duration in beats
		\amp, Pseq(amples, inf),
		\rate, [2, 1],
		\pan, Pwhite(-0.7, 0.7),
	)
);

Ndef(\joshKlinkFx).fadeTime_(0.5);
Ndef(\joshKlinkFx, {
	var snd;
	snd = Ndef(\joshKlink).ar;
	snd = HPF.ar(snd, 1500, 1);
	/*snd = snd + CombN.ar(
		in: snd,
		maxdelaytime: p.clock.tempo * (1/6),
		delaytime: p.clock.tempo * (1/6),
		decaytime: 1);*/
}).play;
)

(
Ndef(\joshKlink).stop(15);
Ndef(\joshKlinkFx).stop(15);
)

// ==================================================
// 4:00 - 4:30 - Listen for Trump gliss down
// ==================================================

(
var samplesl, samplesr, del, feedback, wobble;
samplesl = [\ade0, \ade3, \ade9, \bleep11, \em21, \fm10, \fm14, \hmm0];
samplesr = [\ade0, \ade3, \ade9, \bleep11, \em21, \fm10, \fm14, \hmm0];
del = 0.75; // Delay time in tempo clock divisions (gets added to other delay)
feedback = 0.85; // increase this to ramp up emotion, overdrive kicks in ~0.7
wobble = 0.333; // increase this to less than 1 for chaos

Ndef(\joshFb1).quant = 4;
Ndef(\joshFb1,
	Pbind(
		\type, \dirt,
		\sampleName, Prand(samplesr.flat, inf),
		\dur, Pseq(~dursFrom.(samplesr), inf),
		\stretch, 8, // loop duration in beats
		\amp, 0.3,
		\rate, Pwhite(0.99, 1.01) * Prand([-0.5, 1, 0.5, -1, -0.25], inf),
		\pan, Pwhite(0.75, 1.0),
	)
);
Ndef(\joshFb2).quant = 4;
Ndef(\joshFb2,
	Pbind(
		\type, \dirt,
		\sampleName, Prand(samplesl.flat, inf),
		\dur, Pseq(~dursFrom.(samplesl), inf),
		\stretch, 8, // loop duration in beats
		\amp, 0.3,
		\rate, Pwhite(0.99, 1.01) * Prand([-0.5, 1, 0.5, -1, -0.25], inf),
		\pan, Pwhite(-1.0, -0.75),
	)
);
Ndef(\joshFbFx, {
	var snd;
	snd = Ndef(\joshFb1).ar + Ndef(\joshFb2).ar;
	snd = snd + LocalIn.ar(2);
	snd = snd.reverse;
	snd = DelayN.ar(
		in: snd,
		maxdelaytime: p.clock.tempo * del,
		delaytime: p.clock.tempo * del,
	);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 0.1,
		delaytime: LinLin.ar(
			in: LFNoise1.ar(0.7).pow(5) * wobble,
			srclo: -1, srchi: 1,
			dstlo: 0.02, dsthi: 0.08),
		decaytime: 0.1);
	LocalOut.ar((snd).tanh * feedback);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.7,
		damp: 0.3,
		mul: 0.65
	);
});
)

// ==================================================
// 5:47 - Run rampdown
// ==================================================

Ndef(\joshFbListen, { Ndef(\joshFbFx).ar * Line.kr(0, 1, 20) }).play;

Ndef(\joshFbListen, { Ndef(\joshFbFx).ar * Line.kr(1, 0, 10) }).play;

(
Ndef(\joshFb1).stop(1);
Ndef(\joshFb2).stop(1);
Ndef(\joshFbFx).stop(1);
Ndef(\joshFbListen).stop(1);
)

// ==================================================
// 5:57 - Bouncing Squares, Bass only
// ==================================================

(
var samples;//13 15 16
samples = [\pluck13, \r, \r, \r, \r, \r, \r, \r,
	       \pluck13, \r, \r, \pluck15, \r, \r, \r, \r];

Ndef(\joshBass).fadeTime_(0).quant_(4);
Ndef(\joshBass,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 8, // double it to ramp
		\amp, 1.5,
		\sus, Pseq([
			0.5, 0.5, 0.1, 0.5, 0.5, 0.5, 0.5, 0.1,
			0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.1, 0.1], inf),
		\rel, 0.5,
		\rate, Pwhite(0.995, 1.005) * 2/3,
		\pan, Pwhite(-0.3, -0.3),
	)
).play;
)

(
Ndef(\joshBassFx).fadeTime_(0.5);
Ndef(\joshBassFx, {
	var snd;
	snd = Ndef(\joshBass).ar;
	snd = (snd * 20).tanh * 0.05; //distortion at ~ * 15
	snd = snd + DelayN.ar(
		in: snd,
		maxdelaytime: 0.05,
		delaytime: 500.reciprocal); // resonator for weird grit
}).play;
)

// ==================================================
// 8:28 - first BLM, launch the backwards playback
// ==================================================

(
var samples;//13 15 16
samples = [\pluck13, \r, \pluck2, \pluck15, \r, \r, \pluck1, \r,
	       \pluck13, \r, \r, \pluck15, \r, \pluck16, \r, \pluck8];


Ndef(\joshBass).fadeTime_(0).quant_(4);
Ndef(\joshBass,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 8, // double it to ramp
		\amp, [1.5, 0.7] * 1,
		\sus, Pwhite(0.2, 0.6) * [1, 1],// then sample dur will be used instead
		\rel, Pwhite(0.1, 0.5),
		\rate, Pwhite(0.995, 1.005) * 2/3 * [1, -3],
		\pan, Pwhite(-0.3, -0.3),
	)
).play;
)

// ==================================================
// 8:45 - faster BLM flashing, increase distortion a bit
// ==================================================

(
Ndef(\joshBassFx).fadeTime_(0.5);
Ndef(\joshBassFx, {
	var snd;
	snd = Ndef(\joshBass).ar;
	snd = (snd * 35).tanh * 0.05; //distortion at ~ * 15
	snd = snd + DelayN.ar(
		in: snd,
		maxdelaytime: 0.05,
		delaytime: LFNoise1.ar(1).range(50, 500).reciprocal); // resonator for weird grit
}).play;
)

// =======================================
// 9:01 - NJNP for 2 minutes until 10:50
// =======================================

(
Ndef(\joshBassFx).fadeTime_(0.5);
Ndef(\joshBassFx, {
	var snd;
	snd = Ndef(\joshBass).ar;
	snd = (snd * 55).tanh * 0.05; //distortion at ~ * 15
	snd = snd + DelayN.ar(
		in: snd,
		maxdelaytime: 0.05,
		delaytime: LFNoise1.ar(1).range(50, 500).reciprocal); // resonator for weird grit
	snd = snd + DelayN.ar(
		in: snd,
		maxdelaytime: 0.05,
		delaytime: LFNoise2.ar(15).range(50, 1000).reciprocal);
	//snd = snd * LFPulse.ar(p.clock.tempo * 3, 0.5, 0.75).range(0, 1).slew(5000, 10000);
}).play;
)

(
Ndef(\joshBass).stop(30);
)
(
Ndef(\joshBassFx).stop(30);
)
