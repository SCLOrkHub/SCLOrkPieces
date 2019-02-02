/////////////////////////
// Sandstrom Functions
// FOR BELL PLAYERS
// (include main routine)


// Miscellaneous stuff:

~startAtMeasure = 1;
~synth = "wikiBell";


// This takes care of all score stuff;

r = Routine({arg inbar;

	var flatScore, startingPoint;

	"Start of Routine".postln;

	// Start fresh synth array (in m. 58 sopranos go up to 4 divisi voices):
	~divisi = Array.newClear(4);
	"Synth array cleared".postln;

	s.freeAll;

	~masterOut = Synth("masterOut", addAction: \addToTail);

	// "inbar" is the bar we want to start playing from.
	// A "bar" is an array containing one or two inner arrays.
	// One inner array means the bar is filled with whole notes.
	// Two inner arrays mean the bar has at least one divisi voice moving by half-notes.

	// From requested inbar, take element at index 0 to be our startingPoint.
	// This is useful for rehearsals (can start from any downbeat of any bar, even if notes are tied).
	startingPoint = ~originalScore.at(inbar).at(0);

	startingPoint.postln;
	("ready to start from bar " ++ inbar ++ "...").postln;

	"Waiting".yield;

	// Play startingPoint immediately, as long as a divisi voice has a non-zero value.
	// Tied notes (negative numbers) are ignored, so rehearsal can start from any downbeat.
	startingPoint.do({arg note, index; if(note!=0, {~divisi[index] = Synth(~synth, [\freq, note.abs.midicps])}) });

	// Make a copy of the score WITHOUT barlines (that is, flatten the array by one level).
	// Also drop first element which was just played above (startingPoint).
	flatScore = ~originalScore.copyToEnd(inbar).flatten(1).drop(1);

	// Wait for next cue:
	"Waiting...".yield;

	// From next cue onwards, we go through the flatScore one step at a time.
	// Upon each call to "next", the program finds and plays the next change of notes, then yield.

	flatScore.size.do({arg i;

		var test = flatScore.at(i).isPositive.indexOf(true).notNil; // is there any positive midinote here?

		if(test, { // if true, we found a note change
			flatScore.at(i).postln; // post that "step"
			// Inside this "step" (an Array), index is divisi voice number; item is midinote.
			// "Do" the array to start and stop notes accordingly.
			flatScore.at(i).do({arg note, divisiVoice; ~moveOn.value(divisiVoice, note)});

			// Wait for next cue to continue iteration over flatScore array:
			"waiting again...".yield});
	});

}); // end of Routine


////////////////////////////////////////
// Function that takes care of playing
// & releasing synths, or changing notes:

~moveOn = {arg index, midinote; // index is divisi voice number
case
	// when midinote is positive, play a new bell
	{midinote > 0} { ~divisi[index] = Synth(~synth, [\freq, midinote.midicps]) }

	// when midinote is negative,
	{midinote < 0} { "note tied over from before".postln }

	// when midinote is zero (meaning, go silent now),
	{midinote == 0} { "nothing".postln };
};

/*
For self-terminating bell synths, no need for housekeeping and manual release etc.
*/



~playBell = {
	case
	{~originalScore == ~sopranoScore} {
		p = Pseq([
			Pbind(
				\instrument, "wikiBell2",
				\note, 17,
				\amp, Pwhite(0.2, 0.4),
				\ringTime, Pseq([Pn(12, 18), Pseries(12, 0.5, 30)], 1),
				\att, Pseq([Pn(0.01, 18), Pseries(0.01, 0.01, 30)], 1),
				\dur, Pgeom(0.5, 1.05, 48)
			),
			Pbind(
				\instrument, Pwrand(["wikiBell3", "wikiBell2"], [0.8, 0.2], inf),
				\note, 17,
				\ctranspose, Prand([0, -12, -24], inf),
				\amp, Pwhite(0.2, 0.4),
				\ringTime, Pwhite(20, 30),
				\att, Pwhite(1, 5),
				\dur, Pwhite(10, 12)
			)]

).play;
	}

	{~originalScore == ~altoScore} {
		p = Pseq([
			Pbind(
				\instrument, "wikiBell2",
				\note, 5,
				\amp, Pwhite(0.4, 0.6),
				\ringTime, Pseq([Pn(12, 10), Pseries(12, 0.5, 30)], 1),
				\att, Pseq([Pn(0.01, 10), Pseries(0.01, 0.01, 30)], 1),
				\dur, Pgeom(0.9, 1.05, 30)
			),
			Pbind(
				\instrument, Pwrand(["wikiBell3", "wikiBell2"], [0.8, 0.2], inf),
				\note, 5,
				\ctranspose, Prand([0, -12, 12], inf),
				\amp, Pwhite(0.2, 0.4),
				\ringTime, Pwhite(20, 30),
				\att, Pwhite(1, 5),
				\dur, Pwhite(10, 12)
			)]
).play;
	}

	{~originalScore == ~tenorScore} {
		p = Pseq([
			Pbind(
				\instrument, "wikiBell2",
				\note, 0,
				\amp, 0.5,
				\ringTime, Pseq([Pn(14, 10), Pseries(12, 0.5, 20)], 1),
				\att, Pseq([Pn(0.01, 10), Pseries(0.01, 0.01, 20)], 1),
				\dur, Pgeom(1, 1.09, 25)
		),
			Pbind(
				\instrument, "wikiBell2",
				\note, 0,
				\ctranspose, Prand([0, -12, 12], inf),
				\amp, Pwhite(0.2, 0.4),
				\ringTime, Pwhite(20, 30),
				\att, Pwhite(1, 4),
				\dur, Pwhite(10, 12)
			)]
).play;
	}

	{~originalScore == ~bassScore} {
		p = Pseq([
			Pbind(
				\instrument, "wikiBell2",
				\note, -7,
				\amp, Pwhite(0.2, 0.4),
				\ringTime, Pseq([Pn(12, 10), Pseries(12, 0.5, 30)], 1),
				\att, Pseq([Pn(0.01, 15), Pseries(0.01, 0.01, 43)], 1),
				\dur, Pgeom(0.5, 1.06, 40)
			),
			Pbind(
				\instrument, Pwrand(["wikiBell3", "wikiBell2"], [0.8, 0.2], inf),
				\note, -7,
				\ctranspose, Prand([0, 12, 24], inf),
				\amp, Pwhite(0.2, 0.4),
				\ringTime, Pwhite(20, 30),
				\att, Pwhite(1, 5),
				\dur, Pwhite(10, 12)
			)]
).play;
	}
}; // end of ~playBell function


"Functions loaded".postln;
" ".postln;