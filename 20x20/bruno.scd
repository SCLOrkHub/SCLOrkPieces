//
// 20x20 BRUNO STARTER CODE
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
bruno live coding file
*/


// TO DO
/*
December 2020
- Make sure gr synthdef is loading OK
- Consider loading dirt samples and sclorksynths automatically
- Fix sclorksynths so it does not do s.freeAll (it should be safe to audition synths while playing live in public)
- Build a bass from bouncing squares towards BLM
- Make that fit the progression with baldwin vocals
- fix SCLOrkWatch score that has BLM time wrong
- Load New Piece button - move it to just below Load All the Rest
- Rename Load All the Rest to RESET or something?
- If players click Load All the Rest, they MUST click on Load New Piece 20x20 again. How to simplify?

- BRUNO SCORE:
- less loud voices at beginning
- less loud trump
- less loud baldwin fx
- less loud drums
- plan for clear break at downbeat of bouncing squares
- (make compose out the Ndefs for the negative image moment)
- REHEARSE - get re-familiarized with Ndefs!

- aastha will work on guitar for njnp
- noonan textures

*/






"this is a test, a really good test".postln;
"but not more than just a test".postln;
"".postln;

// =====================================
// VIDEO STUFF & RESET
// =====================================

// Reload settings (must do if anyone recompiles class library
(Quarks.folder +/+ "SCLOrkPieces/20x20/20x20_Setup.scd").load;

// Now custom functions should work:
~openVideo.(1);

~startVideoAndSCLOrkWatch.value(1);

(
~rewindVideo.value(1);
~closeSCLOrkWatch.value;
)

// =====================================
// CONDUCTOR STUFF (for end of piece)
// =====================================

~listAll.value;
~freeAll.value(5, [\tempo, \t]);
~freeAll.value(5, [\btrump]);

// Aastha's a1
Ndef(\a1).free
Ndef(\a1).send;

// don't use it out in the open
// Ndef.clear(1);


Ndef(\b1).free(5);
Ndef(\b1).stop(5);
Ndef(\bfx1).stop(15);
Ndef(\bfx2).stop(5);
Ndef(\trump).stop(5);
Ndef(\ssaw).pause;
Ndef(\prog1).stop(5);
Ndef(\prog2).stop(5);
Ndef(\btrump).stop(4);
Ndef(\cov).stop(10);




// =====================================
// 1:02 Add one recording of news reports
// =====================================
// after first full statement, begin with random .choose of voices

(
Ndef(\cov).fadeTime = 1;
Ndef(\cov, {
	var snd;
	var sample;
	var rate;
	sample = d.covid4; //[d.covid1, d.covid2, d.covid3].choose;
	// sample = [d.covid1, d.covid2, d.covid3, d.covid4, d.covid4].choose;
	rate = 1;
	// rate = rrand(0.999, 1.01) * LFSaw.ar(1/[4,6,10]).range(0.9, 1.9);
	// rate = [1, -1.2, 0.99, 1.01] * [1, SinOsc.kr(1/[3.2, 2]).range(2, 7), 1];
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: sample,
		rate: rate * BufRateScale.kr(sample),
		startPos: [0, 0.015, 0.003] * BufFrames.kr(sample),
		loop: 1
	);
	// snd = snd * [0.7, 0.3, 0.3, 0.7] * 0.9;
	// snd = snd * [0.7, 0.3, 0.3, 0.7] * SinOsc.ar(1/3).range(0.1, 0.5);
	snd = Splay.ar(snd);
	snd = Limiter.ar(snd) / 4;
	// snd = snd * LFPulse.kr(15, 0, LFNoise2.kr(1/4).range(0.4, 0.9));


// =====================================
// 1:30 suddently busy -- add more voices, add high pitch
// =====================================

(
Ndef(\cov).stop(30);
Ndef(\covhi).fadeTime = 1;
Ndef(\covhi, {
	var snd, sample, rate, amp;
	sample = d.covid4;
	sample = { [d.covid1, d.covid2, d.covid3, d.covid4].choose }.dup(4);
	rate = Line.kr(1, [2, 0.7, 1, 5], [1, 1.1, 1.2]);
	amp = 0.4;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: sample,
		rate: rate * BufRateScale.kr(sample),
		startPos: 0 * BufFrames.kr(sample),
		loop: 1
	) * amp;
	// snd = snd * [0.7, 0.3, 0.3, 0.7] * 0.9;
	// snd = snd * SinOsc.ar([1,2,3,4]).range(0.5, 1);
	snd = Splay.ar(snd);
	snd = Limiter.ar(snd) * amp;
}).play;
)





// =====================================
// 2:41 dizzy unsettling - trump's denial
// =====================================

// run this repeatedly to restart from given startPos
// this will feed into \btrump
(
Ndef(\raw2, { PlayBuf.ar(1, d.trump, startPos: 0.275 * BufFrames.kr(d.trump), loop: 1) });
// some 2-channel controls
Ndef(\pitchRatio).reshaping = \elastic;
Ndef(\pitchRatio, { Line.kr([1, 1], [0.9999, 1.08], 80) }).kr;
// Ndef(\li, { LFNoise0.kr(1/[2, 4]).range(0.95, 1.55) });
Ndef(\disp, { XLine.kr(0.0001, 0.1, 35) });
)

(
// Ndef(\raw).send;
Ndef(\btrump).fadeTime = 2;
Ndef(\btrump, {
	var sample = d.trump;
	var snd = Ndef(\raw2).ar;
	snd = PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		// pitchRatio: 1, //[1.0, 1.005, 0.995],
		pitchRatio: Ndef(\pitchRatio).kr,
		pitchDispersion: Ndef(\disp), //SinOsc.ar(1/3).range(0, 0.19),
		timeDispersion: 0.0,
		mul: 1.35, //[1, 0.5]
	);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.2,
		room: 0.6,
		damp: 0.1
	);
	snd = snd * [1, 1, 1];
	snd = Splay.ar(snd);
}).play;
)

Ndef(\raw2).send;


Ndef(\disp, { XLine.kr(0.0001, 0.2, 5) });

Ndef(\pitchRatio, { Line.kr([1, 1], [0.5, 1, 1.5, 4], 10) })

Ndef(\pitchRatio, { LFNoise0.kr(1/[2, 4]).range(0.95, 1.55) });


// =====================================
// 3:14 slower orderly
// =====================================

Ndef(\covhi).stop(1);

Ndef(\pitchRatio, { XLine.kr([0.5, 1, 2], 4, 10) }).fadeTime_(2)




// NEXT STEPS:

// prepare a sudden halt into looping mass ? at 4:42, four corners slow blink.

// prepare a sudden burst / transition for negative image (10 seconds) - or buildup

// which will lead into sparse bass octaves.







// section A6 at 3:56 - only 9 dots, nervous

// section A7 at 4:42 - 4 corners, slow blink - full minute of it

// section A end: negative image at 5:47 to 5:57

// SECTION B - 5:57

// B1 - bouncing squares until 8:28
// bass only - take your time -- add drums slowly
//


// 6:58 - NOTHING - remove score ref

// B2 - BLM at 8:28

// 8:45 BLM flashing rapidly

// 9:01-10:50+- NJNP

// 10:50 - breathing dots

// 11:30 end, stop running any more code, Bruno to begin fade out



Ndef(\btrump).stop(19);

(
Ndef(\biden).quant = 4;
Ndef(\biden,
	Pbind(
		\instrument, \gr,
		\buffer, d.biden,
		\startPos, Pseq([
			Pseries(0.38, 0.01, 10),
			Pseq([0.47, 0.5], inf)
		], inf),
		\dur, Pseq([Pn(7, 8), Pn(1, inf)], inf),
		\stretch, Pdef(\stretch, 1),
		\att, 0.001,
		\rel, Pseq([Pseq([7, 7, 6, 5, 5, 5, 2]), Pseq([3, 1], inf)], inf).trace,
		\legato, 1,
		\rate, 2,
		\amp, 0.57,
		\pan, Pwhite(-1.0, 1.0),
	)
).play;
)

Ndef(\cov).stop(10);
Ndef(\biden).stop(10);
Ndef(\btrump).stop(10)


// NEGATIVE IMAGE 5:47
(
Ndef(\prog1).fadeTime = 0;
Ndef(\prog1, {
	var snd;
	var sample;
	var rate;
	sample = d.progress;
	sample = [d.progress, d.kaba];
	rate = rrand(0.999, 1.01);
	// rate = rate * [1, 1.01, 0.975, 1.05] * 0.98;
	// rate = rate * SinOsc.ar(1).range(0.9, 1.4);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: sample,
		rate: rate * BufRateScale.kr(sample),
		startPos: 0.0 * BufFrames.kr(sample),
		loop: 1
	);
	snd = snd * [1, 0.5] * 1; // start at 7
	snd = Splay.ar(snd);
	// snd = snd * LFPulse.kr(MouseX.kr(5, 10), 0, LFNoise2.kr(1/4).range(0.1, 0.9));
}).play;
)

d.crow2

Ndef(\prog1).stop(15);
Ndef(\prog2).stop;
Ndef(\b1).stop(4);
Ndef(\bfx).stop(4);

(
Ndef(\prog2).quant = 1;
Ndef(\prog2,
	Pbind(
		\instrument, \gr,
		\buffer, d.progress,
		// \buffer, d.kaba,
		\startPos, Pseq([
			Pseries(0.00, 0.01, 30),
			Pwhite(0.3, 0.45, inf)
		], inf),
		\dur, 1/15, //Pseq([Pn(7, 8), Pn(1, inf)], inf),
		\stretch, 1,
		\att, 0.001,
		\rel, 1, //Pseq([Pseq([7, 7, 6, 5, 5, 5, 2]), Pseq([3, 1], inf)], inf).trace,
		\legato, 1,
		\rate,  Pwhite(0.91, 1.015),
		\amp, 1/10,
		\pan, Pwhite(-1.0, 1.0),
	)
).play;
)


(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0!4, \drum2, \techno1, \drum2];
// samples = [\bubble3!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\control0, \gab7, Prand([\east2, \coins0])!2, \dork22]; // \r is a rest
samples = [\amencutup0, [\drum2, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];
// samples = [\house5!2, \house2, \cp0, \db3];

Ndef(\b1).fadeTime = 0;
Ndef(\b1).quant = 4;
Ndef(\b1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 5,
		\rate, Pwhite(1, 1.01) * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

// Stop monitoring the dry Ndef:
Ndef(\b1).stop(13); // notice that "stop" really means just stop sending to speakers, does not stop running the Ndef
Ndef(\b1).play; // or bring it back


// Easily add fx
// first create Ndef(\bfx), then map desired input (line 92)
(
Ndef(\bfx).fadeTime = 2;
Ndef(\bfx, {
	var snd, snd1;
	snd = Ndef(\b1).ar;
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: p.clock.tempo / 2.5, // make delay in sync with tempo
		decaytime: 5
	);
	snd.distort.tanh;

	snd = FreeVerb.ar(
		in: snd,
		mix: 0.405,
		room: 0.57,
		damp: 0.97,
		mul: 1
	);

}).play;
)

// Send \b1 into \bfx
Ndef(\bfx).stop(20);
Ndef(\b1).clear

(
~rewindVideo.value(1);
~closeSCLOrkWatch.value;
)

~freeAll.(10);






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
Ndef(\bfx).unmap(\in2)
Ndef(\tpt).stop(10);




// and now a bit of trump
// notice that this Pbind does NOT use the Cycles style for durations, we compose durs manually here (the 'usual' way)

(
Ndef(\trump).quant = 4;
Ndef(\trump,
	Pbind(
		\instrument, \gr,
		\buffer, d.trump,
		\startPos, Pdef(\startPos,
			Pstutter(5, Pseq([0.19, 0.201, 0.339, 0.54], inf))
		),
		\dur, Pseq([Pn(0.5, 3), 0.25, 0.25], inf),
		\stretch, Pdef(\stretch, 2),
		\att, 0.001,
		\rel, Pdef(\rel, 0.45),
		\legato, Pdef(\legato, 0.58),
		\rate, Pdef(\rate,
			Pstutter(10, Prand([0.95, 1, 1], inf))
		),
		\amp, 0.7,
		\pan, Pwhite(-1.0, 1.0),
	)
).play;
)

(
Pdef(\rel, 0.3);
Pdef(\legato, 1);
Pdef(\stretch, 4);
)

(
Pdef(\rate, Pstutter(10, Prand([1.5, 1, 1], inf)) )
)

(
Pdef(\rel, Pwrand([1, 0.2], [0.1, 0.9], inf));
Pdef(\stretch, 1);
Pdef(\startPos,
	Pstutter(5, Pseq([0.119, 0.2201, 0.3339, 0.554], inf))
)
)

Ndef(\trump).stop(10);


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
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 10,
		\amp, Pseq([0.4, Pgeom(0.25, 1.2, 5), Pseq([0.4, 0.3, 0.2]), 1.9], inf),
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
		\note, Pseq([0, 2, 3, 0, 2, 3, 5, 3, 2, 7, 0, -7], inf),
		\ctranspose, -12,
		\amp, 0.1,
		\legato, 0.6,
		\numberOscs, Pseq([10, 25, 10, 25, 25, 5, 8, 11, 12], inf),
		\dur, Pseq([3, 3, 8, 2, 8, 3, 3, 5, 1], inf) * Prand([1, 0.5, 0.5], inf),
		\stretch, 3,
		\fatt, Pseq([0.5, 0.5, 1, 0.5, 1, 0.5, 0.5, 0.7, 0.4], inf),
	);
).play;
)
(
Ndef(\bfx2).fadeTime = 2;
Ndef(\bfx2, {
	var snd, in1, in2, in3;
	in1 = \in1.ar([0, 0]); in2 = \in2.ar([0, 0]); in3 = \in3.ar([0, 0]);

	snd = (in1 * 0.25) + (in2 * 1) + (in3 * 1);
	snd = CombC.ar(
		in: HPF.ar(snd, 1000),
		maxdelaytime: 1,
		delaytime: p.clock.tempo / [3, 5, 4], // make delay in sync with tempo
		decaytime: [2.5, 2, 1.4] * 5
	);
	snd.distort.tanh;
	snd = FreeVerb.ar(
		in: in1 + snd,
		mix: 0.64,
		room: 0.57,
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

Ndef(\ssaw).stop(5);
Ndef(\b1).stop(5);
Ndef(\bfx2).stop(5);


Ndef(\ssaw).pause;
Ndef(\b1).pause;

// =======================================
// =======================================
// =======================================



















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


// samples = [\glitch23!3, \e7!5, \east2!3, \ifdrums0!3]; // \r is a rest
// samples = [\glitch23!2, \birds4, \can6!2, \ifdrums0!2]; //BIRD
// samples = [\glitch20, \e7!2, \bass1, \can7]; // NICE
// samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];









