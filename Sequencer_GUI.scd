

// Load SynthDefs file (only once after you open SuperCollider)
"SynthDefs.scd".loadRelative;


// Create a new time client
// This needs to be done ONLY ONCE after you open SuperCollider
// It will survive Ctrl+period
~timeClient = SCLOrkTimeClient.new;


// Start the clock
// Print the beats
// If you hit Ctrl+period, you have to run this again
(
~clock = SCLOrkClock.new(~timeClient);
~clock.play({ "server beats: %".format(~clock.beats).postln; ^1 });
)

// Pick your instrument (only one)
// ~myInstrument = \hihat;
// ~myInstrument = \snare;
// ~myInstrument = \kick;
~myInstrument = \bass;


// SEQUENCER GUI

(
// close previous windows
Window.closeAll;
// create window
w = Window.new("sequencer", Rect(10, 10, 1040, 600)).front;
// organize layout
w.view.decorator = FlowLayout(w.view.bounds, 20@20, 5@5 );
// create buttons
~buttons = 32.collect{ Button( w.view,120@120 ) };
// define buttons' states
~buttons.do({ arg b; b.states = [["0", Color.grey, Color.white], ["1", Color.white, Color.grey]] });
// define buttons' actions
~buttons.do({ arg b; b.action = { ~ampArray = ~buttons.collect({ arg b; b.value }); /*~ampArray.postln*/ Pbindef(~myInstrument, \amp, Pseq(~ampArray, inf)) } });

w.onClose = { Pbindef(~myInstrument).stop };

case
{~myInstrument==\hihat} {
	Pbindef(\hihat,
	\instrument, "hihat",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.1,
	\ffreq, 11000,
	\amp, Pseq(~ampArray, inf),
).play(~clock, quant: 4).quant = 4;
}

{~myInstrument==\snare} {
	Pbindef(\snare,
	\instrument, "snare",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.1,
	\sinfreq, 180,
	\ffreq, 2000,
	\amp, Pseq(~ampArray, inf),
).play(~clock, quant: 4).quant = 4;
}

{~myInstrument==\kick} {
	Pbindef(\kick,
	\instrument, "kick",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.22,
	\sinfreq, 70,
	\glissf, 0.9,
	\amp, Pseq(~ampArray, inf),
).play(~clock, quant: 4).quant = 4;
}

{~myInstrument==\bass} {
	Pbindef(\bass,
	\instrument, "sawSynth",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.2,
	\ctranspose, -12,
	\midinote, Pseq([
		48, 48, 48, 48,   49, 49, 50, 52, // beat 1
		48, 51, 48, 48,   51, 55, 66, 51, // beat 2
		48, 46, 48, 45,   44, 46, 48, 49, // beat 3
		48, 51, 48, 48,   45, 46, 55, 54, // beat 4
	], inf),
	\amp, Pseq(~ampArray, inf)
).play(~clock, quant: 4).quant = 4;
}; // end of case expression
)


