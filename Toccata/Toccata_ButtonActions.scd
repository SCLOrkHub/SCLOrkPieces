// ===========================
// Toccata V3
// Button Actions
// ===========================

// this file should load AFTER SynthDef file

// ===============
// OPEN GUI
// ===============
~quNeo = SCLOrkQuNeo.new.preset(\toggle);

// ===============
// BUTTON ACTIONS & LABELS
// ===============
(
~quNeo.onButtonChange = { | velocity, midinote |
	var synth;

	switch(midinote,

		// =========
		// OBJECT 1 - PITCH VAR
		// =========
		36, {
			if(velocity>0, {
				Synth("Object1",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 2 - LOOPING PITCH VAR
		// =========
		37, {
			if(velocity>0, {
				{
					Synth("Object2",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[2]
						],
						target: ~objects[midinote]);
					// in the original toccata, user would push button a second time to stop recording and start looping 1-sec buffer.
					// here I chose to allow a fixed amount of time until recording stops and looping begins.
					// [note for future: might consider using velocity to define how long to wait until loop begins]
					"recording into buffer #2...".postln;
					5.wait;
					"now looping fx 37 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(4);
			});
			},
		// =========
		// OBJECT 3 - SPAWNING PITCH VAR
		// =========
		38, {
			if(velocity>0, {
				{
					var repeats = velocity.linlin(0, 127, 1, 5);
					("spawning fx #38 " ++ repeats ++ " times...").postln;
					repeats.do({
						Synth("Object3",
							[
								\in, ~micBus,
								\out, ~fxBus,
								\buffer, ~recBuffer[3],
								\pitchDispersion, rrand(0.0, 2.0)
							],
							target: ~objects[midinote]);
						rrand(1, 4).wait;
					});
					"now looping fx 38 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(7);
			});
			},
		// =========
		// OBJECT 4 - GRAINY SOUND
		// =========
		39, {
			if(velocity>0, {
				Synth("Object4",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 5 - MECHANICAL POPCORN
		// =========
		40, {
			if(velocity>0, {
				{
					Synth("Object5",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[5]
						],
						target: ~objects[midinote]);
					"recording into fx 40 buffer...".postln;
					5.wait;
					"now looping fx 40 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(15);
			});
			},
		// =========
		// OBJECT 6 - MECHANICAL PHRASER
		// =========
		41, {
			if(velocity>0, {
				{
					Synth("Object6",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[6]
						],
						target: ~objects[midinote]);
					"recording into fx 41 buffer...".postln;
					5.wait;
					"now looping fx 41 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(18);
			});
			},
		// =========
		// OBJECT 7 - DRASTIC PITCH MOD
		// =========
		42, {
			if(velocity>0, {
				Synth("Object7",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(6);
			});
		},
		// =========
		// OBJECT 8 - FOR LONG TONE
		// =========
		43, {
			if(velocity>0, {
				Synth("Object8",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(5);
			});
		},
		// =========
		// OBJECT 9 - LOOPING REVERSE
		// =========
		44, {
			if(velocity>0, {
				{
					Synth("Object9",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[9]
						],
						target: ~objects[midinote]);
					"recording into fx 44 buffer...".postln;
					5.wait;
					"now looping fx 44 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(8);
			});
			},
		// =========
		// OBJECT 10 - LOOPING PITCH VAR 2
		// =========
		45, {
			if(velocity>0, {
				{
					Synth("Object10",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[10]
						],
						target: ~objects[midinote]);
					"recording into fx 45 buffer...".postln;
					5.wait;
					"now looping fx 45 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(4);
			});
			},
		// =========
		// OBJECT 11b - revrev delay instead of GRAINY HIGH (CombC simple delay)
		// =========
		46, {
			if(velocity>0, {
				Synth("Object11b",
					[
						\in, ~micBus,
						\out, ~fxBus,
						\delay, velocity.linexp(0, 127, 1, 0.1),
						\decay, rrand(3, 10),
						\buffer, ~recBuffer[11]

					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(7);
			});
		},
		// =========
		// OBJECT 12 - GRAINY SOUND LOW
		// =========
		47, {
			if(velocity>0, {
				Synth("Object12",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(5);
			});
		},
		// =========
		// OBJECT 13 - PITCH MODULATION
		// =========
		48, {
			if(velocity>0, {
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 14 - SOUR DELAY
		// =========
		49, {
			if(velocity>0, {
				Synth("Object14",
					[
						\in, ~micBus,
						\out, ~fxBus,
						\delay, velocity.linexp(0, 127, 0.6, 0.01),
						\decay, rrand(2, 10)
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(5);
			});
		},
		// =========
		// OBJECT 15 -
		// =========
		50, {
			if(velocity>0, {
				/*
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
				*/
			}, {
				// ~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 16 -
		// =========
		51, {
			if(velocity>0, {
				/*
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
				*/
			}, {
				// ~objects[midinote].release(2);
			});
		}
	);

};

~quNeo.changeButtonLabel(36, "\nPITCH\nVARIATION");
~quNeo.changeButtonLabel(37, "\nLOOPING \nPITCH VAR");
~quNeo.changeButtonLabel(38, "\nSPAWNING \nPITCH VAR");
~quNeo.changeButtonLabel(39, "\nGRAINY\nSOUND");
~quNeo.changeButtonLabel(40, "\nMECHANICAL\nPOPCORN");
~quNeo.changeButtonLabel(41, "\nMECHANICAL\nPHRASER");
~quNeo.changeButtonLabel(42, "\nDRASTIC\nPICTH MOD");
~quNeo.changeButtonLabel(43, "\nFOR LONG TONES");
~quNeo.changeButtonLabel(44, "\nLOOPING\nREVERSE");
~quNeo.changeButtonLabel(45, "\nLOOPING\nPITCH VAR 2");
~quNeo.changeButtonLabel(46, "\nREVREV\nDELAY");
~quNeo.changeButtonLabel(47, "\nGRAINY\nLOW");
~quNeo.changeButtonLabel(48, "\nPITCH\nMODULATION");
~quNeo.changeButtonLabel(49, "\nSOUR\nDELAY");
// ~quNeo.changeButtonLabel(50, "empty");
// ~quNeo.changeButtonLabel(51, "empty");

~quNeo.onSliderChange = { |value, sliderNum|
	switch(sliderNum,
		6, {~mixerSynth.set(\directMicLevel, value)},
		7, {~mixerSynth.set(\reverbAmount, value)},
		8, {~mixerSynth.set(\fxLevel, value)},
		9, {~mixerSynth.set(\masterVolume, value)},
		10, {~mixerSynth.set(\pan, value.linlin(0, 1, -1.0, 1.0))}
	);
};

~quNeo.changeSliderLabel(6, "dry\nout", false);
~quNeo.changeSliderLabel(7, "wet\nout", false);
~quNeo.changeSliderLabel(8, "fx\nout", false);
~quNeo.changeSliderLabel(9, "main\nvol", false);
~quNeo.changeSliderLabel(10, "pan\n", false);

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