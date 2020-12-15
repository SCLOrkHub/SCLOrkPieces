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
// 1:02 Add intro recording of news reports
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
}).play;
)


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
	// rate = Line.kr(1, [2, 0.7, 1, 5], [1, 1.1, 1.2]);
	rate = Line.kr(1, [2, 0.7, 1, 5], [10, 2, 1.1, 13, 1.2]);
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
		mix: \mix.kr(0.2),
		room: \room.kr(0.6),
		damp: 0.1
	);
	snd = snd * [1, 1, 1];
	snd = Splay.ar(snd);
}).play;
)


// restart trum sample
Ndef(\raw2).send;


Ndef(\disp, { XLine.kr(0.0001, 0.2, 5) });


Ndef(\pitchRatio, { Line.kr([1, 1], [0.5, 1, 1.5, 4], 10) })

Ndef(\pitchRatio, { LFNoise0.kr(1/[2, 4]).range(0.95, 1.55) });


// =====================================
// 3:14 slower orderly
// =====================================

// clean up
Ndef(\covhi).stop(1);
Ndef(\cov).clear;
Ndef(\covhi).clear;

// nice plateau on high pitches
Ndef(\pitchRatio, { XLine.kr([0.5, 1, 2], 4, 10) }).fadeTime_(2)

// for variety -- rhythmic unison to high spread
Ndef(\disp, { XLine.kr(0.0001, 0.8, 5) });
Ndef(\disp, { LFNoise2.kr(1/5).range(0.0001, 0.8) });
Ndef(\disp, { SinOsc.kr(1/2).range(0.0001, 0.8) });



// =====================================
// 3:56 (9 dots) or 4:30 (pre-4) - trump's nosedive
// =====================================

Ndef(\pitchRatio, { XLine.kr(4, 0.25, 20).round(0.125) }).fadeTime_(2)
Ndef(\btrump).set(\mix, 0.5, \room, 0.9)

// if needed, go back to beginning of sample
Ndef(\raw2).send;

Ndef(\btrump).end(10);


// =====================================
// 5:47 - NEGATIVE IMAGE - all fade out
// =====================================

// remove & clear all previous Ndefs

Ndef(\cov).clear;
Ndef(\covhi).clear;
Ndef(\brump).end(10); // if not ended already
Ndef(\brump).clear(10); // or this

// =====================================
// 5:57 - bouncing squares BASS ONLY
// =====================================


// bass goes on for a while. Eventually introduce James Baldwin's voice:
(
Ndef(\prog1).fadeTime = 0;
Ndef(\prog1, {
	var snd;
	var sample;
	var rate;
	sample = d.progress;
	// sample = [d.progress, d.kaba];
	rate = rrand(0.999, 1.01);
	// rate = rate * [1, 1.01, 0.975, 1.05] * 0.98;
	// rate = rate * LFNoise2.ar(3).range(0.95, 1.102);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: sample,
		rate: rate * BufRateScale.kr(sample),
		startPos: 0.0 * BufFrames.kr(sample),
		loop: 1
	);
	snd = snd * [1, 0.5, 1]; // * SinOsc.ar([2, 3]);
	snd = Splay.ar(snd);
	// snd = snd * LFPulse.kr(MouseX.kr(5, 10), 0, LFNoise2.kr(1/4).range(0.1, 0.9));
}).play;
)

// shortly after, introduce M. Kaba's voice too

// optional background made with same voices
(
Ndef(\prog2).quant = 1;
Ndef(\prog2,
	Pbind(
		\instrument, \gr,
		\buffer, d.progress,
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


Ndef(\prog1).end(10);
Ndef(\prog2).end(10);


// =====================================
// 8:28 - DRUMS COME IN RIGHT ON DOWNBEAT
// =====================================
// 8:45 speed up?

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0!2, \drum2, \techno1, \drum2];
// samples = [\amencutup0, [\drum2, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = [\amencutup0, [\house2, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
samples = [\amencutup0, [\drum2, \cp0], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = [\amencutup3, [\bubble3, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
samples = [\amencutup0, [\drum3, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = [\bd0, [\techno0, \drum2], \bd0, \drum1, \hh3, \techno1, \amencutup13, \techno1];

Ndef(\b1).fadeTime = 0;
Ndef(\b1).quant = 4;
Ndef(\b1,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 2,
		\rate, Pwhite(1, 1.01) * Pwrand([1, 0.5, 0.91], [9, 3, 1].normalizeSum, inf)
		// make Pwhite go up to 2 at fast flashing
		// and make 0.91 negative
	)
).play
)

Ndef(\b1).clear;
// Stop monitoring the dry Ndef:
Ndef(\b1).stop(1);
Ndef(\b1).play;



// =======================================
// 9:01 - NJNP for 2 minutes until 10:50 -- add fx?
// =======================================

(
Ndef(\bfx).fadeTime_(1).quant_(4);
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

	snd = LFPulse.ar(p.clock.tempo*2, 0, 0.25) * snd;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.405,
		room: 0.57,
		damp: 0.97,
		mul: 4
	);

}).play;
)


Ndef(\b1).play(vol: 1.0);
Ndef(\bfx).play(vol: 1);


Ndef(\b1).stop(1);
Ndef(\bfx).stop(1);


// extra
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



~endAll.(10);





// NEXT STEPS:

// prepare a sudden halt into looping mass ? at 4:42, four corners slow blink.

// prepare a sudden burst / transition for negative image (10 seconds) - or buildup

// which will lead into sparse bass octaves.







// section A6 at 3:56 - only 9 dots, nervous

// section A7 at 4:42 - 4 corners, slow blink - full minute of it
// josh's voices enter

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









