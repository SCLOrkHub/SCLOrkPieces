/*

-- loads necessary scd files

-- provides some Pbindef examples

*/

// Choose startup_hyperSCLOrk
StartupFile.choose;

// Reboot interpreter (red buttons will appear)
thisProcess.recompile;

// Load all 2000 samples (will reboot server automatically)
// Takes several seconds to load them all, watch Post window
"SCLOrkDirtSamplesLoad.scd".loadRelative;

// Load a simple SynthDef called \pb for playback
"SCLOrkDirtSamplesSynthDef.scd".loadRelative;

// Load couple custom functions to allow "cycles" live coding style
"SCLOrkDirtSamplesFunctions.scd".loadRelative;

// Load some Ndef stuff
"Fall-2020-raw-sample.scd".loadRelative;

// Browse samples with a GUI (useful to familiarize yourself with what's available)
// the sample name in the GUI is what you will use in the live coding as a Symbol
// for example, sample named ab8 can be used as \ab8 in your code
"SCLOrkDirtSamplesBrowse.scd".loadRelative;

// Open SCLOrkChat (no need to change this line; variable ~myName already should contain your name)
SCLOrkChat.new(~myName.asString);


// ******************************************
// ... now go PUBLIC (click the red button "PUBLIC")
// ******************************************

// ... and now open your own live coding file (save one if you don't have it already)

"aastha.scd".resolveRelative.openDocument;
"bruno.scd".resolveRelative.openDocument;
"ed.scd".resolveRelative.openDocument;
"josh.scd".resolveRelative.openDocument;
"noonan.scd".resolveRelative.openDocument;


"template.scd".resolveRelative.openDocument;








// EXAMPLES
// do not modify, just copy as needed into your own live coding file




(
var samples;
// samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house5!2, \house2, \cp0, \db3];
// samples = [\house1, \house2, \cp0, \a808ht4];
samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];
// samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\bass10, \gab7, \east2!3, \dork22]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \east2!3, \ifdrums0!3]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \juno3!2, \ifdrums0!3]; // \r is a rest
// samples = [\glitch20, \e7!5, \juno3, \latibro6];
// samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];
// samples = [\amencutup0, [\drum2, \drum2], \drum0, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = \bd9.dup(16);
// samples = \sn0.dup(8); // long version for \sn0!8


// NOTICE HOW THE PBIND HERE IS INSIDE AN NDEF
Ndef(\p1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 1,
		\amp, 0.5, //Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
		\rate, Pwhite(1, 1.01) * 1
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\p1).stop; // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\p1).play; // or bring it back


// Easily add fx
// first create Ndef(\fx), then map desired input (line 92)
(
Ndef(\fx, {
	var snd;
	snd = \in1.ar([0, 0]) + \in2.ar([0, 0]) + \in3.ar([0, 0]);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: p.clock.tempo / 4, // make delay in sync with tempo
		decaytime: 4
	);
	snd.distort.tanh;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.25,
		room: 0.7,
		damp: 0.97,
		mul: 1
	);

}).play;
)

// Send \p1 into \fx
Ndef(\fx).map(\in1, Ndef(\p1));

Ndef(\fx).stop; // remove fx (stop monitoring)
Ndef(\fx).play; // add it back on




// a bit of trumpET

(
var samples;
samples = [\trump0, \r, \trump1, \r];
samples = [\trump0, \r, \trump1!2, \trump3];
// samples = [\trump0, \trump3!2, \trump1!2, \trump3];
// samples = [\trump0, \trump3!2, \trump1!2, \trump3!4];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];

Ndef(\tpt,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 1,
		\amp, 0.5, //Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
		\rate, Pwhite(0.25, 2.0).round(0.25) * 1.12,
		\pan, Pwhite(-1, 1)
	)
).play
)


// Send \tpt into \fx
Ndef(\fx).map(\in2, Ndef(\tpt));

Ndef(\tpt).stop;




// and now a bit of trump
// notice that this Pbind does NOT use the Cycles style for durations, we compose durs manually here (the 'usual' way)

(
Ndef(\trump,
	Pbind(
		\instrument, \gr,
		\buffer, ~trump,
		// \startPos, Pwhite(0, 1.0),
		\startPos, 0.239, //Pseq([Pn(0.1, 10), Pn(0.3, 10), Pn(0.8, 5)], inf), // 0.0=beginning of sample, 0.5=half way into sample, 1.0=end of sample
		\dur, Pseq([Pn(0.5, 3), 0.25, 0.25], inf) * 4,
		\att, 0.001,
		\rel, 4,
		\legato, 0.995,
		\rate, Pstutter(10, Prand([0.5, 1, 1, 1.1], inf)), //Pwhite(1, 1.5), // 1=original speed, 0.5=half speed, 2=twice speed, etc.
	// a negative number for \rate makes sound goes backward
		\amp, 1,
		\pan, Pwhite(-1.0, 1.0),
	)
).play;
)



Ndef.clear(5);




// etc....










(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \flick11, \drum2, \techno1, \drum2];
// samples = [\dr7, \dr29!rrand(1, 3), \house2!2, \glitch23];
// samples = [\blip1, \blip0, \a808oh3, \blip1];
// samples = [\ab4, \alphabet6, Prand([\bass112, \sn1, \sn2]), \db3];

Ndef(\blah,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 1,
		\amp, Pseq([0.5, 0.45, 0.4, 0.3], inf) * 0.9 * Pwhite(0.90, 1),
		\rate, Pstutter(4, Pseq([1, 1.1, 1.02, 0.998, 1.5], inf))
	)
).play
)







