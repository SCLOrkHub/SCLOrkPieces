/////////////////////////
// Sandstrom Functions
// (include main routine)


// Miscellaneous stuff:

~startAtMeasure = 1;
~synth = "sine5";


// This takes care of all score stuff;

r = Routine({arg inbar;

	var flatScore, startingPoint;

	"Start of Routine".postln;

	// Start fresh synth array (in m. 58 sopranos go up to 4 divisi voices):
	~divisi = Array.newClear(4);
	"Synth array cleared".postln;

	s.freeAll;

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

	~masterOut = Synth("masterOut", addAction: \addToTail);

	// Play startingPoint immediately, as long as a divisi voice has a non-zero value.
	// Tied notes (negative numbers) are ignored, so rehearsal can start from any downbeat.
	startingPoint.do({arg note, index; if(note!=0, {~divisi[index] = Synth(~synth, [\midinote, note.abs])}) });

	// Make a copy of the score WITHOUT barlines (that is, flatten the array by one level).
	// Also drop first element which was just played above (startingPoint).
	flatScore = ~originalScore.copyToEnd(inbar).flatten(1).drop(1);

	// "Here is the flat score".postln;
	// flatScore.postln;

	// Wait for next cue:
	"Waiting...".yield;

	// From next cue onwards, we go through the flatScore one step at a time.
	// Upon each call to "next", the program finds and plays the next change of notes, then yield.
	// What is "next change of notes"? It's when at least one of the notes changes state:
	// - when a divisi voice was silent and now enters with a note;
	// - when a divisi voice was singing a note and now changes pitch to another note;
	// - when a divisi voice was singing a note and now goes silent (becomes a rest);
	// Divisi voices singing tied notes are just left alone.

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
	// when midinote is positive,
	{midinote > 0} {if(
		~divisi[index].isNil, // is this voice silent?
		{ ~divisi[index] = Synth(~synth, [\midinote, midinote]) }, // if yes, then start a new synth here;
		{ ~divisi[index].set(\midinote, midinote) } )} // else, change the pitch from previous note.

	// when midinote is negative,
	{midinote < 0} {"note tied over from before".postln}

	// when midinote is zero (meaning, go silent now),
	{midinote == 0} {if(
		~divisi[index].notNil, // is this voice currently singing?
		{~divisi[index].release; ~divisi[index] = nil}, // if yes, release the synth and write 'nil' in there;
		{"just another rest".postln})};
};
/*
Explanation:
IF midinote is POSITIVE, play that note (if voice was silent, create new synth; if voice was playing, change its note).
IF midinote is NEGATIVE, do nothing (it's just a tie from a previous note).
IF midinote is ZERO, stop the voice in case it was playing; otherwise, do nothing.
*/


"Functions loaded".postln;
" ".postln;