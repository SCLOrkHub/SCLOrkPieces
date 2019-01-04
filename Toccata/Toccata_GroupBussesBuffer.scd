// ===========================
// Toccata V3
// Groups, Busses, Buffer
// ===========================

// this file should load AFTER SynthDef file

// ===============
// CREATE GROUPS
// ===============
~source = Group.new;
~effects = Group.new(~source, \addAfter);
~master = Group.new(~effects, \addAfter);

~micBus = Bus.audio(s, 1);
~fxBus = Bus.audio(s, 1);
~recBuffer = Buffer.alloc(s, s.sampleRate * 1.0, 1);


// ===============
// RUN MIC SYNTH
// ===============
~micSynth = Synth("MicBuffer", [\out, ~micBus], target: ~source);

// ================
// RUN MIXER SYNTH
// ================
~mixerSynth = Synth(
	defName: "Mixer",
	args: [
		\directMicBus, ~micBus,
		\directMicLevel, 1.0,
		\fxBus, ~fxBus,
		\fxLevel, 1.0,
		\reverbAmount, 1.0,
		\masterVolume, 1.0
	],
	target: ~master
);












/*
// Object 1 example
(
~o1 = Synth(
	defName: "Object1",
	args: [\in, ~micBus, \out, ~fxBus],
	target: ~effects
);
)
~o1.release;

~mixerSynth.set(\directMicLevel, 1.0);
~mixerSynth.set(\fxLevel, 1.0);
~mixerSynth.set(\reverbAmount, 1.0);
~mixerSynth.set(\masterVolume, 1.0);
~mixerSynth.free;


// UPON ENDING THE PIECE

s.freeAll;
*/