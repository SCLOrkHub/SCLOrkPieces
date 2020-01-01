// ===========================
// Toccata V3
// Button Actions
// ===========================

// this file should load AFTER SynthDef file

// ===============
// BUTTON ACTIONS
// ===============



// eventually this will look like

/*

q = SCLOrkQuNeo.new;

q.onButtonChange = { | velocity, midinote |

switch(midinote,
36, {},
37, {}
...
etc
);


*/

// Button1
// 36. Pitch Variation


// if each button instantiates only one Node, then we can use an array to keep a reference to them
~synthArray = Array.newClear(127);

{ |midinote, velocity|
	var synth;

	synth = switch(midinote,
		36, {"Object1"},
		37, {"Object2"},
		38, {"Object3"},
		39, {"Object4"},
		40, {"Object5"},
		41, {"Object6"},
		42, {"Object7"},
		43, {"Object8"},
		44, {"Object9"},
		45, {"Object10"},
		46, {"Object11"},
		47, {"Object12"},
		48, {"Object13"},
		49, {"Object14"},
		50, {"Object15"},
		51, {"Object16"}
	);


	// will all SynthDefs work with this standard call? Probably not
	// I may have to do a longer switch where entirely diff Synth calls are inside each function
	if(velocity>0, {
		synthArray[midinote] = Synth(
			defName: synth,
			args: [\in, ~micBus, \out, ~fxBus],
			target: ~effects
		)
	}, {
		synthArray[midinote].release
	});







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