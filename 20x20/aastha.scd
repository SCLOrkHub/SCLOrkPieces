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
//samples = [\bass118, \bass117]; // very stranger things esque -- !!! 2:41 !!!
samples = [\feelfx0, \feelfx2!2]; // weird ethereal sounds !!!START HERE!!
Ndef(\spookysynths).fadeTime = 5;
Ndef(\spookysynths).quant = 4;
Ndef(\spookysynths,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4, //make it smaller as you progress
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6, // change the * 0.1 time for volume
		\rate, Pwhite(0.1, 1.01) * Prand([-1, 1], inf) * 0.9, // AVOID ZERO RATE
		\pan, Pwhite(-1.0, 1.0),
	)
).play
)
// !!!STOP AROUND 5:57!!!!
Ndef(\spookysynths).stop(5);
Ndef(\spookysynths).play;
Ndef(\spookysynths).free;


// interesting rumbling sounds

(
var samples;

//samples = [\jungbass14!2, \jungbass15!2, \jungbass19!2, \jungbass18!2];
//samples = [\jungle4];
samples = [\moog0, \moog3];

Ndef(\bouncingrumble).fadeTime = 5;
Ndef(\bouncingrumble).quant = 4;
Ndef(\bouncingrumble,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf), // * 0.4 to make it pulse kinda
		\stretch, 4, //make it smaller as you progress
		\amp, Pseq([0.4001, 0.29, 0.4, 0.3], inf) * 0.4,
		\rate, Pwhite(0, 1.01) * 0.9,
		\pan, Pwhite(-1.0, 1.0),
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\bouncingrumble).stop(5); // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\bouncingrumble).play; // or bring it back
Ndef.clear;


// guitar slashes

(
var samples;

//samples = [\jungbass14, \drumtraks3, \em21, \feelfx3, \gtr2];
samples = [\jungbass14, \gretsch15, \em21, \feelfx3, \gtr2!4];

Ndef(\oofguitar).fadeTime = 5;
Ndef(\oofguitar).quant = 4;
Ndef(\oofguitar,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.01, // make this louder eventually
		\rate, Pwhite(-1, 1.01) * 0.7,
		\pan, Pwhite(-1.0, 1.0),
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\oofguitar).stop(10); // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\oofguitar).play; // or bring it back



// hand washing sound

(
var samples;
samples = [\hand2!2, \hand0!n];

Ndef(\hands).fadeTime = 5;
Ndef(\hands).quant = 4;
Ndef(\hands,
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

Ndef(\hands).stop(5);
