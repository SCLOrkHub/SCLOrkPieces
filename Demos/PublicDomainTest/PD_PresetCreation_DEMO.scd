/ ===========================
// Preset creation -- guidelines
// ===========================

// Small Group Rehearsals for Jan 17, 2019

// 30 minutes: Review this page and one of the example presets (like Bruno-1). Help each other so that everyone understands the basic structure of a Pbindef with the parameters below.

// 60 minutes: Work individually on building an original preset, with anything from 3 to 8 voices (\p1, \p2, \p3, etc...). Use headphones.

// 30 minutes: wrap up by playing your presets to each other, get feedback. If preset is finished, save file with with name PD_Preset_Name-1.scd, send to Bruno by email



// This file assumes you have gone through the START HERE file successfully (that is, samples are loaded, clock is running etc).




// Start by isolating single voices and crafting them.
// You can isolate a single Pbindef by enclosing it into separate parentheses (code block), like this:

(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1996A'),
	\dur, 1/8,
	\rate, 0.98,
	\startPos, 0.023,
	\att, 0.001,
	\rel, 1,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;
)

// Notice how the player above simply plays one hit on the first and third beat of each measure, and that's it.

// REFRESHER - WHAT ARE THE PARAMETERS?

// bufnum is the "buffer" (sample) you want to choose (by year).

// dur is the duration of the notes. Above, 1/8, means one beat divided by 8, or the equivalent of a 32nd note if you consider the quarter note = 1 beat. Also bear in mind that BPM here is always 60 (for now).

// rate is the playback speed. Imagine playing a vynil record. 1 is regular speed. 2 is twice as fast ('mickey mouse effect'), which transposes the whole thing one octave above. 0.5 is half speed, or one octave below. 4 is two octaves above, etc.
// Cool tip: if you use a negative number for rate, the sample will play in REVERSE!

// attack is the time it takes, in seconds, for the sample ('note') to go from silence to full sound. Shorter attacks around 0.01 up to 0.1 are good for clear hits. Larger attacks (above 0.1) create a kind of "crescendo" effect into the note.

// release is tail of the note, kind of the counterpart of attack. The longer the release, the more "note" you will have. So for example a release of 2 will make every single hit to have a 2 second tail until it fades out completely. Try this out in the Pbindef above.

// amp is the amplitude. We've been using this kind of long Pseq of zeros and ones for amp, basically as a way to build a "rhythmic grid". The zeros are silence, and ones are sound.
// Notice the interaction between the \dur paramter and the \amp grid. A \dur of 1/8 is like asking for 32nd notes, but the only ones that will actually sound are the ones that are not zero in the amp grid.




// Now I'll add a second voice to play at the same time as \p1

(
Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1985A'),
	\dur, 1/8,
	\rate, 1.01,
	\startPos, 0.01,
	\att, 0.001,
	\rel, Pwhite(0.5, 1.1),
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 1, 0, // beat 1
		1, 0, 0, 0, 0, 0, 1, 0,// beat 2
		1, 0, 0, 0, 0, 0, 1, 0,// beat 3
		1, 0, 0, 0, 1, 0, 1, 1,// beat 4
	], inf) * 0.7,
).play(~clock, quant: 4).quant = 4;
)


// Notice how you can multiply the end of the amp grid by a number to scale it up or down (i.e., turn the volume up or down globally as needed). Above, I multiply the end of the amp line by 0.8

// Also notice the subtle use of Pwhite for \rel, within 0.7 and 1.1
// This makes some of the snares to end more abruplty (when a shorter value is chosen by Pwhite), or the snare sample might continue for a bit longer (when the chosen value is longer)





// adding one more player (\p3):
(
Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1940A'),
	\dur, 1/8,
	\rate, 0.81,
	\startPos, 0.39,
	\att, 0.001,
	\rel, 2,
	\amp, Pseq([
		1, 0, 0, 0, 0, 0, 0, 0, // beat 1
		0, 0, 0, 0, 0, 0, 0, 0, // beat 2
		1, 0, 0, 0, 0, 0, 0, 0, // beat 3
		0, 0, 0, 0, 0, 0, 0, 0, // beat 4
	], inf) * 1,
).play(~clock, quant: 4).quant = 4;
)






// one more (\p4)
(
Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1947A'),
	\dur, 2,
	\rate, Pseq([
		0.66, 0.66, 0.66, 0.66,
		0.88, 0.88, 0.66, 0.66,
		1.0, 0.88, 0.66, 0.66
	], inf),
	\startPos, 0.04,
	\att, 0.001,
	\rel, 5,
	\amp, 0.7,
).play(~clock, quant: 4).quant = 4;
)


// and last one (\p5)
(
Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('2016A'),
	\dur, 1/8,
	\rate, 1,
	\startPos, 0.5,
	\att, 0.001,
	\rel, 5,
	\amp, Pseq([
		0, 0, 0, 0, 0, 0, 0, 0, // beat 1
		1, 0, 0, 0, 0, 0, 0, 0,// beat 2
		0, 0, 0, 0, 1, 0, 0, 0,// beat 3
		0, 0, 0, 0, 0, 0, 0, 0,// beat 4
	], inf) * 0.8,
).play(~clock, quant: 4).quant = 4;
)



// ==================================
// TOOLS to make your life easier:
// ==================================


// Pause all Pbindefs at once
Pbindef.all.do{|i| i.pause };

// Resume all:
Pbindef.all.do{|i| i.resume };

// If everything is broken:
Pbindef.all.do({ |i| i.clear });

// Pause / resume individual Pbindefs:
Pbindef(\p1).pause;
Pbindef(\p2).pause;
Pbindef(\p3).pause;
Pbindef(\p4).pause;
Pbindef(\p5).pause;
Pbindef(\p6).pause;
Pbindef(\p7).pause;
Pbindef(\p8).pause;

Pbindef(\p1).resume;
Pbindef(\p2).resume;
Pbindef(\p3).resume;
Pbindef(\p4).resume;
Pbindef(\p5).resume;
Pbindef(\p6).resume;
Pbindef(\p7).resume;
Pbindef(\p8).resume;
