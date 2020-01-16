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

q = SCLOrkQuNeo.new;
(
q.onButtonChange = { | velocity, midinote |
	var synth;

	switch(midinote,
		36, {
			if(velocity>0, {
				~synthArray[midinote] = Synth("Object1",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~effects);
			}, {
				~synthArray[midinote].release;
			});
		},

		37, {
			if(velocity>0, {
				~synthArray[midinote] = Synth("Object2",
					[
						\in, ~micBus,
						\out, ~fxBus,
						\buffer, ~recBuffer[2]
					],
					target: ~effects);
			}, {
				~synthArray[midinote].release;
			});
			// original code used button states to set up looping.
			// user would trigger button once (start recording)
			// then push button a second time to stop recording
			// so that buffer would now loop old contents.
			// since buffer is always same length, it is not about defining loop durations. Its'just, at what point do you want to stop recording new material so that buffer overlaps?
			// maybe use the stop button to serve as 'cutoff' recording? (but then button 37 has to be last thing clicked)?
		},
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

};
)


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