/*

bruno live coding file


*/







// EXAMPLES
// (do not modify them here -- create your own file for live coding, save it in this same directory);

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
samples = [\techno2, \bd0, \cp0, \cp1];
samples = [\bubble3!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house1, \house2, \cp0, \a808ht4];
// samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\control0, \gab7, Prand([\east2, \coins0])!2, \dork22]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \east2!3, \ifdrums0!3]; // \r is a rest
// samples = [\glitch23!2, \birds4, \can6!2, \ifdrums0!2]; //BIRD
// samples = [\glitch20, \e7!2, \bass1, \can7]; // NICE
// samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];
samples = [\amencutup0, [\drum2, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];
// samples = [\house5!2, \house2, \cp0, \db3];


Ndef(\b1).quant = 4;
Ndef(\b1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.2,
		\rate, Pwhite(1, 1.01) * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\b1).stop; // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\b1).play; // or bring it back


// Easily add fx
// first create Ndef(\bfx), then map desired input (line 92)
(
Ndef(\bfx).fadeTime = 2;
Ndef(\bfx, {
	var snd, snd1;
	snd = \in1.ar([0, 0]) + \in2.ar([0, 0]) + \in3.ar([0, 0]);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: p.clock.tempo / 4, // make delay in sync with tempo
		decaytime: 1.5
	);
	snd.distort.tanh;

	snd = FreeVerb.ar(
		in: snd,
		mix: 0.405,
		room: 0.37,
		damp: 0.97,
		mul: 1
	);

}).play;
)

// Send \b1 into \bfx
Ndef(\bfx).map(\in1, Ndef(\b1));
// OR
Ndef(\bfx) <<>.in1 Ndef(\b1);
Ndef(\bfx).unmap(\in1);
Ndef(\bfx).stop(3); // remove fx (stop monitoring)
Ndef(\bfx).play; // add it back on




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
		\stretch, 2,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf),
		\rate, Pwhite(0.25, 2.0).round(0.25) * 1.12,
		\pan, Pwhite(-1, 1)
	)
).play
)


// Send \tpt into \bfx
Ndef(\bfx).map(\in2, Ndef(\tpt));

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



// =======================================
// =======================================
// Dark texture
(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
samples = [\techno2, \bd0, \cp0, \cp1];
samples = [\bubble3!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house1, \house2, \cp0, \a808ht4];
samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\bass10, \e7!5, \east2!3, [\bd5, \r, \bd0]]; // \r is a rest

Ndef(\b1).quant = 4;
Ndef(\b1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf).trace,
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 8,
		\amp, Pseq([0.4, Pgeom(0.25, 1.2, 5), Pn(0.4, 3), 1.9], inf),
		\rate, Pwhite(1, 1.01) * 1
		* Pfunc({ |e|
			if(e.sampleName === \dork22, { -1.09 }, { 1 })
		}),
	)
).play;
)
(
Ndef(\ssaw,
	Pbind(
		\instrument, "superSaw",
		\note, Pseq([0, 2, 3, 0, 2, 3, 5, 3, 2, 4, 0, -7], inf),
		\ctranspose, -12,
		\amp, 0.1,
		\legato, 0.6,
		\numberOscs, Pseq([10, 25, 10, 25, 25, 5, 8, 11, 12], inf),
		\dur, Pseq([3, 3, 8, 2, 8, 3, 3, 5, 1], inf) * Prand([1, 0.5, 0.5], inf),
		\fatt, Pseq([0.5, 0.5, 2, 0.5, 1, 0.5, 0.5, 0.7, 4], inf),

	);
).play;
)
(
Ndef(\bfx2).fadeTime = 2;
Ndef(\bfx2, {
	var snd;
	snd = \in1.ar([0, 0]) + \in2.ar([0, 0]) + \in3.ar([0, 0]);
	snd = CombC.ar(
		in: HPF.ar(snd, 1000),
		maxdelaytime: 1,
		delaytime: p.clock.tempo / [3, 5, 4], // make delay in sync with tempo
		decaytime: [2.5, 2, 1.4] * 5
	);
	snd.distort.tanh;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.27,
		damp: 0.97,
		mul: 1
	);
	Splay.ar(snd);
}).play;
)

Ndef(\bfx2) <<>.in1 Ndef(\b1);


Ndef(\bfx2).unmap(\in1)
Ndef(\bfx2) <<>.in1 nil;
Ndef(\bfx2).map(\in2, Ndef(\ssaw));

Ndef(\bfx2).stop(5);
Ndef(\ssaw).stop(5);
Ndef(\b1).stop(5);

Ndef(\ssaw).pause;
Ndef(\b1).pause;

Ndef.clear(1)
// =======================================
// =======================================
// =======================================









Ndef.clear(5)











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

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
samples = [\techno2, \bd0, \cp0, \cp1];
samples = [\bubble3!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house1, \house2, \cp0, \a808ht4];
samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
samples = [\bass10, \e7!5, \east2!3, [\bd5, \r, \bd0]]; // \r is a rest

Ndef(\b1).quant = 4;
Ndef(\b1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf).trace,
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf),
		\rate, Pwhite(1, 1.01) * 1
	)
).play
)







