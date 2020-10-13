/*

Template to create your own live coding file

*/

// Rename your Ndefs based on your name:

Ndef(\a1) // aastha
Ndef(\b1) // bruno
Ndef(\e1) // ed
Ndef(\j1) // josh
Ndef(\n1) // noonan

// for the fx Ndef...
Ndef(\afx) // aastha
Ndef(\bfx) // bruno
Ndef(\efx) // ed
Ndef(\jfx) // josh
Ndef(\nfx) // noonan


// EXAMPLES
// (do not modify them here -- create your own file for live coding, save it in this same directory);

(
var samples;
// samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house5!2, \house2, \cp0, \db3];
// samples = [\house1, \house2, \cp0, \a808ht4];
samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];


//
Ndef(\p1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4, // loop duration in beats
		\amp, 0.5,
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
		\startPos, 0.19, //Pseq([Pn(0.1, 10), Pn(0.3, 10), Pn(0.8, 5)], inf), // 0.0=beginning of sample, 0.5=half way into sample, 1.0=end of sample
		\dur, Pseq([Pn(0.5, 3), 0.25, 0.25], inf),
		\att, 0.001,
		\rel, 1,
		\legato, 0.995,
		\rate, Pstutter(10, Prand([0.5, 1, 1], inf)), //Pwhite(1, 1.5), // 1=original speed, 0.5=half speed, 2=twice speed, etc.
	// a negative number for \rate makes sound goes backward
		\amp, 3,
		\pan, Pwhite(-1.0, 1.0),
	)
).play;
)

Ndef(\trump).stop;

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







