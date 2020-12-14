//
// 20x20 AASTHA STARTER CODE
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


/*

aastha's live coding file


*/

// dark spooooky bass

(
var samples;
//switch off between these
//samples = [\bass117!3, \bass118!3, \bass129!3, \bass128!3]; // more airy bouncy spooky
//samples = [\bass118, \bass117]; // very stranger things esque
samples = [\feelfx0, \feelfx2!2]; // weird ethereal sounds START HERE
Ndef(\a1).fadeTime = 5;
Ndef(\a1).quant = 4;
Ndef(\a1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4, //make it smaller as you progress
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6, // change the * 0.1 time for volume
		//\rate, Pwhite(-1, 1.01) * 0.9,
		\rate, Pwhite(0.1, 1.01) * Prand([-1, 1], inf) * 0.9, // AVOID ZERO RATE
		\pan, Pwhite(-1.0, 1.0),
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\a1).stop(5); // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\a1).play; // or bring it back
Ndef(\a1).free;

// Easily add fx
// first create Ndef(\bfx), then map desired input (line 92)
(
Ndef(\afx).fadeTime = 2;
Ndef(\afx, {
	var snd, snd1;
	snd = \in1.ar([0, 0]) + \in2.ar([0, 0]) + \in3.ar([0, 0]);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: p.clock.tempo / 2.5, // make delay in sync with tempo
		decaytime: 3.5
	);
	snd.distort.tanh;

	snd = FreeVerb.ar(
		in: snd,
		mix: 0.405,
		room: 0.37,
		damp: 0.97,
		mul: 0.3
	);
	//snd = Pan2.ar(in: snd, pos: Saw.ar(XLine.kr(0.001,100, 10)));
	snd = Pan2.ar(
		in: snd,
// pos: Saw.ar(XLine.kr(0,100)) // Aastha's original crackling
// pos: Saw.ar(freq: XLine.kr(1, 100, 10)) // variation 1 (reaches crackling in x seconds)
		pos: LFNoise0.ar(freq: XLine.kr(1, 100, 30)) // variation 2
	);
	snd = Limiter.ar(snd);
}).play;
)

// Send \a1 into \afx
Ndef(\afx).map(\in1, Ndef(\a1));
// Send \a2 into \afx
Ndef(\afx) <<>.in1 Ndef(\a2);
Ndef(\afx).unmap(\in1);
Ndef(\afx).stop(5); // remove fx (stop monitoring)
Ndef(\afx).play; // add it back on


(
var samples;

samples = [\jungbass14, \drumtraks3, \em21, \feelfx3, \gtr2];

Ndef(\a2).fadeTime = 5;
Ndef(\a2).quant = 4;
Ndef(\a2,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 2, //make it smaller as you progress
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.1,
		\rate, Pwhite(0, 1.01) * 0.9,
		\pan, Pwhite(-1.0, 1.0),
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\a2).stop(10); // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\a2).play; // or bring it back



// hand washing sound
(
var samples;
samples = [\hand2!2, \hand8!n];

Ndef(\a2).fadeTime = 5;
Ndef(\a3).quant = 4;
Ndef(\a3,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4, // make it smaller as you progress, 4 and 3 are best
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.2,
		\rate, Pwhite(1, 1.01) * 1,
		\pan, Pwhite(-1.0, 1.0),
	)
).play
)

Ndef(\a3).stop(5);
