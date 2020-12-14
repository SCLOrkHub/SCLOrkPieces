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

(
var samples;
samples = [\pluck13, \r, \r, \pluck15, \r, \r, \r, \r,
	       \pluck13, \r, \r, \pluck15, \r, \pluck16, \r, \r,];

Ndef(\j4).fadeTime_(0.5);
Ndef(\j4,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4, // double it to ramp
		\amp, 0.75,
		\rate, Pwhite(0.995, 1.005) * 2/3,
		\pan, Pwhite(-0.3, -0.3),
	)
).play
)


(
Ndef(\j4fx).fadeTime_(0.5);
Ndef(\j4fx, {
	var snd;
	snd = \in1.ar([0, 0]);
	snd = (snd * 65).tanh * 0.1; //distortion at ~ * 15
	snd = snd + DelayN.ar(
		in: snd,
		maxdelaytime: 0.05,
		delaytime: LFNoise2.ar(0.3).range(50, 1000).reciprocal);//LFNoise1.ar(15).range(50, 500).reciprocal); // resonator for weird grit
	snd = snd + DelayN.ar(
		in: snd,
		maxdelaytime: 0.05,
		delaytime: LFNoise2.ar(1).range(50, 1000).reciprocal);
}).play;

Ndef(\j4fx).map(\in1, Ndef(\j4));
)

(
Ndef(\j4).stop(30);
)
(
Ndef(\j4fx).stop(30);
)


(
Ndef(\j3, {DC.ar(0)}).play;
Ndef(\j3fx).fadeTime_(15);
)

(
var samples;
samples = [\alphabet0, \alphabet4, \alphabet8, \alphabet14, \alphabet20, \r, \r, \r,
	       \r,         \r,         \r,         \r,          \r,          \r, \r, \r].scramble;

Ndef(\j3).fadeTime_(5);
Ndef(\j3,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 6, // loop duration in beats
		\amp, 0.2,
		\rate, Pwhite(0.99, 1.01) * Pseq([-2, 2, 3], inf),
		\pan, Pwhite(-0.3, -0.3),
	)
).play
)

(
Ndef(\j3).stop(15);
Ndef(\j3fx, {
	var snd;
	snd = \in3.ar([0, 0]);
	snd = PitchShift.ar(
		in: snd,
		windowSize: 0.1,
		pitchRatio: LFNoise0.ar(0.5).range(5, 7).round(1)/2,
		pitchDispersion: 0.1,
		timeDispersion: 0.5);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.95,
		damp: 0,
		mul: 1
	);

}).play;

Ndef(\j3fx).map(\in3, Ndef(\j3));
)

(
Ndef(\j3).stop(10);
Ndef(\j3fx).stop(10);
)