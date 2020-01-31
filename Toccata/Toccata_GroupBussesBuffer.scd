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
// Create an array of sub-groups inside ~effects;
// Each sub-group will accommodate one or more synth nodes one same effect
// This is useful for spawning synths, so we can release them all at the same time
// This makes it unnecessary to save synth nodes individually, as we can simply .release the entire sub-group
~objects = Array.fill(127, { |i|
	if( (i<36)||(i>100), {
		nil
	}, {
		Group.new(~effects)
	});
}); // create a group in all usable midinote-corresponding indices (36-100), just put nil everywhere else
~master = Group.new(~effects, \addAfter);
~micBus = Bus.audio(s, 1);
~fxBus = Bus.audio(s, 1);
~recBuffer = Array.fill(16, { Buffer.alloc(s, s.sampleRate * 1.0, 1) }); /// not all will be used. Individual buffers are needed because some rec buffers stop at different moments and loop different material.


// ===============
// RUN MIC SYNTH
// ===============
~micSynth = Synth("MicInput", [\out, ~micBus], target: ~source);

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
		\reverbAmount, 0.0,
		\masterVolume, 1.0
	],
	target: ~master
);

"\n.\n.\n.\n.\nGroups and Buffers created; Mic and Mixer Synth are running.".postln;
" ".postln;


// ~objects.do({ |i, c| [c, i].postln })