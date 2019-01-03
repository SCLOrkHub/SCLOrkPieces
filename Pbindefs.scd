


// Load SynthDefs file (only once after you open SuperCollider)
"SynthDefs.scd".loadRelative;


// Create a new time client
// This needs to be done ONLY ONCE after you open SuperCollider
// It will survive Ctrl+period
~timeClient = SCLOrkTimeClient.new;


// Print the beats
(
~clock = SCLOrkClock.new(~timeClient);
~clock.play({ "server beats: %".format(~clock.beats).postln; ^1 });
)

// PS. The clock above will *not* survive Ctrl+period.

~clock = TempoClock.new;
~clock.play({ "beats: %".format(~clock.beats).postln; ^1 })


















// =============
// HIHAT TEST
// =============

(
Pbindef(\hihat,
	\instrument, "hihat",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.1,
	\ffreq, 11000,
	\amp, Pseq([
		1, 1/2, 1/3, 1/4, 0, 1/5, 0, 0, // beat 1
		1, 1/2, 1/3, 1/4, 0, 1/5, 0, 0, // beat 2
		1, 1, 0, 0, 0, 0, 0, 0, // beat 3
		1, 0, 1/3, 0, 1, 0, 1/3, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\hihat).stop;

// =============
// SNARE TEST
// =============

(
Pbindef(\snare,
	\instrument, "snare",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.1,
	\sinfreq, 180,
	\ffreq, 2000,
	\amp, Pseq([
		0, 0, 0, 0,   1, 0, 0, 0, // beat 1
		0, 0, 0, 0,   1, 0, 0, 0, // beat 2
		0, 0, 0, 0,   1, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf) / 4,
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\snare).stop;

(
Pbindef(\kick,
	\instrument, "kick",
	\dur, 1/8,
	\att, 0.01,
	\rel, 0.22,
	\sinfreq, 70,
	\glissf, 0.9,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 0, // beat 2
		1, 0, 0, 0,   0, 0, 0, 0, // beat 3
		1, 0, 0, 0,   0, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\kick).stop;


(
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
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 1, 0,   1, 0, 0, 0, // beat 2
		1, 1, 0, 1,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
)