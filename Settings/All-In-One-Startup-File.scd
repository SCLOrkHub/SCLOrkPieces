//
// SCLOrk Spring 2023
// "All-In-One-Startup-File.scd"
//
// the "move start file" scd script expects that name
//
// NOTE: the 'template' (backup) copy of this file lives in SCLOrkPieces/Settings.
// A copy should be made under
// ~/.config/SuperCollider/startup_files/
// (that's the one SC will actually load at startup)
// Button "Update Quarks" now AUTOMATICALLY COPIES TEMPLATE FROM SETTINGS INTO .CONFIG



// *!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!
//
//
//  IF YOU NEED TO MAKE MODIFICATIONS, MAKE THEM IN THE SOURCE TEMPLATE
//  WHICH IS INSIDE SCLOrkPieces/Settings !!!!!
//  ...then copy it over to .config to test
//
// (Quarks.folder +/+ "SCLOrkPieces/Settings/Move-Startup-File-To-Right-Place.scd").load;
//
//  ...try it, and if all looks good, don't forget to git add * etc.
//
// *!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!
































var textField, loginWindow, requiredQuarks, currentPiece, pipe, buttonArray, window, numberOfButtons;

// get this computer's hostname to use with jacktrip (or anything else)
pipe = Pipe.new("hostname", "r");
~hostname = pipe.getLine;
pipe.close;

requiredQuarks = [
	"SafetyNet",
	// "HyperDisCo",
	"StartupFile",
	"SCLOrkTools",
	"SCLOrkSynths",
	"SCLOrkPieces",
	"Dirt-Samples",
	// "ddwSnippets"
];

loginWindow = Window.new(
	name: "please type your name or nickname (single word lowercase)",
	bounds: Window.screenBounds,
	resizable: false
).front;
loginWindow.background = Color.black;

textField = TextField(
	parent: loginWindow,
	bounds: Rect(
		left: Window.screenBounds.width / 2 - 150,
		top: Window.screenBounds.height / 2 - 100,
		width: 300,
		height: 100
	)
);

textField.font = Font("Arial", 40);
textField.string = "your name?";
textField.align = \center;
textField.stringColor = Color.gray;
textField.mouseDownAction = { textField.string = "" };
textField.keyDownAction = { textField.string = ""; textField.keyDownAction = nil };
textField.action = {arg field; ~myName = field.value.postln; loginWindow.close };

loginWindow.onClose = {

	"*** SCLOrk Spring 2023 Start Up File"
	"*** loading startup file.".postln;


	{
		// Check whether needed quarks are installed:
		requiredQuarks.do({ | name |
			if( (Quarks.installed.any({ | quark | quark.name == name })), {
				(name ++ " Quark is installed :-)").postln;
				"".postln;
			}, {
				// notify that quark is not installed
				("***" ++ name ++ " Quark is NOT installed! :-(").postln;
				// adjust for the one odd case
				if( name == "SCLOrkPieces", { name = "https://github.com/SCLOrkHub/SCLOrkPieces" });
				// print installation instructions
				("Please install it by running:\nQuarks.install(\"" ++ name ++ "\");").postln;
				"".postln;
			});
		});
	}.value;





	~sclorkResetFunction = {


		Ndef.clear;

		// Check if there was a previous clock running
		// ...and if so, stop it
		if(p.notNil,
			{
				p.postln;
				p.clock.postln;
				if(p.clock.isRunning, { p.clock.stop })
			},
			{
				"variable p is empty".postln;
			});

		// Create general purpose clock that Ndefs can use;
		// Default BPM is 60, can be changed later using custom function
		// shortcut to change bpm will be ~bpm.(120)
		p = Ndef(\clock).proxyspace.clock = LinkClock.new.latency_(Server.default.latency);

		// Make sure it survives control period
		p.clock.permanent_(true);

		// Quant zero is good for raw Ndef improvs
		// (but not for Pbind stuff)
		p.quant = 0.0;

		("LinkClock Metronome is at " ++ (p.clock.tempo * 60).round ++ " BPM.").postln;
		"Global Ndef quantization set to 0 beat.".postln;
		"To check current tempo, use ~bpm.()".postln;
		"To set a new tempo, use ~bpm.(90)".postln;
		"Pbinds inside Ndefs will use this tempo.".postln;

		// shortcut to change tempo
		// usage in performance: ~bpm.(120);
		~bpm = { |bpm|
			if(bpm.isNil,
				{
					p.clock.tempo * 60; // if no bpm provided, return current BPM
				}, {
					p.clock.tempo = bpm/60;
				}
			)
		};

		// convenience function that returns current # of seconds per beat ("spb")
		// useful for example to set delay lines in synch with beat
		~spb = { 1 / p.clock.tempo };

		// CYCLES-STYLE function for Pbinds
		// Takes in a list, and optional cycle duration in beats.
		// Returns a list of durations based on the composition of the array
		~dursFrom = {|array, dur=1|
			var size = array.size;
			var subdiv = dur / size;
			var result = array.collect({ |item|
				if(item.isArray, {
					~dursFrom.value(item, subdiv)
				}, {
					subdiv
				});
			});
			result.flat;
		};


		// This event type specifically to use samples
		// It hides the work of picking the right SynthDef based on whether a sample is mono or stereo
		Event.addEventType(\dirt, {
			~instrument = if(d.at(~sampleName).numChannels == 1, { \pb1 }, { \pb2 });
			~buf = d.at(~sampleName);
			// ~testFunc = { |number| number * 2 };
			~type = \note;
			currentEnvironment.play;
		});

		// List all existing Ndefs, with info whether it's playing and monitoring
		~listAll = {
			var isPlaying, isMonitoring, string, return;
			return = List.new;
			Ndef.dictFor(s).do({ | ndef |
				var key = ndef.key;
				isPlaying = if(Ndef(key).isPlaying, { 1 }, { 0 });
				isMonitoring = if(Ndef(key).isMonitoring, { 1 }, { 0 });
				string = "m % p % Ndef(%)";
				if( (isPlaying==1) && (isMonitoring==1),
					{ string = "***" ++ string };
				);
				return.add(string.format(isMonitoring, isPlaying, ("\\" ++ key.asString)));
			});
			return.sort.do({ |s| s.postln });
			"m=monitoring, p=playing";
		};

		// Free all Ndefs except the ones in the list provided as argument
		~freeAll = { | fadeTime = 5, leaveAlone |
			var exceptions = if( leaveAlone.isArray.not, { [ leaveAlone ] }, { leaveAlone });

			// never free metronome Ndefs
			exceptions = exceptions.add([\t, \tempo]).flat;

			Ndef.dictFor(s).do({ | ndef |
				var key = ndef.key;
				if( (exceptions.includes(key).not) && (ndef.isPlaying), {
					("Freeing Ndef(\\" ++ key.asString ++ ")...").postln;
					Ndef(key.asSymbol).free(fadeTime);
				}, {
					// ("Ndef(\\" ++ key.asString ++ ") left untouched").postln;
				})
			});
			"freeing active Ndefs over % seconds... \n".postf(fadeTime);
		};

		// End all Ndefs except the ones in the list provided as argument
		~endAll = { | fadeTime = 5, leaveAlone |
			var exceptions = if( leaveAlone.isArray.not, { [ leaveAlone ] }, { leaveAlone });

			// never free metronome Ndefs
			exceptions = exceptions.add([\t, \tempo]).flat;

			Ndef.dictFor(s).do({ | ndef |
				var key = ndef.key;
				if( (exceptions.includes(key).not) && (ndef.isPlaying), {
					("Ending Ndef(\\" ++ key.asString ++ ")...").postln;
					Ndef(key.asSymbol).end(fadeTime, true);
				}, {
					// ("Ndef(\\" ++ key.asString ++ ") left untouched").postln;
				})
			});
			"ending active Ndefs over % seconds... \n".postf(fadeTime);
		};

		// currentEnvironment.pairsDo({ |k, v| [k, v].postln });

		"Utility Functions loaded".postln;
	};


	Window.closeAll;

	numberOfButtons = 10;

	window = Window.new(
		name: "SCLOrk Buttons",
		bounds: Rect(
			left: 0,
			top: Window.screenBounds.height-200,
			width: 150,
			height: numberOfButtons * 10),
		resizable: true
	);
	window.layout = VLayout();
	window.alwaysOnTop = true;
	window.background = Color.red;

	buttonArray = 10.collect({ Button.new() });
	buttonArray.postln;



	// ============
	// BUTTON 1
	// ============

	buttonArray[0].states = [ [~myName.asSymbol] ];
	buttonArray[0].action = {

		// first action: print my name
		(
			"My name is "
			++
			~myName.asString
			++
			[
				" and I shall not be moved",
				" and I approve of this message"
			].choose;
		).postln;

		// second action: check latest Quarks version SCLOrk stuff
		(
			["SCLOrkTools", "SCLOrkSynths", "SCLOrkPieces"].do({ |repo|
				var pipe;
				pipe = Pipe.new(
					commandLine: "cd "
					++ Quarks.folder
					+/+ repo
					++ "; git rev-parse --short HEAD",
					mode: "r"
				);

				(repo ++ " is at " ++ pipe.getLine).postln;
				pipe.close;
			});
		)
	};

	// ==========
	// BUTTON 2
	// ==========

	buttonArray[1].states = [ ["Load Samples"] ];
	buttonArray[1].action = {
		if( d.size < 2000, {
			d = SCLOrkSamples.loadFolder(Quarks.folder +/+ "Dirt-Samples", 0.02);
			d = SCLOrkSamples.loadFolder(Quarks.folder +/+ "SCLOrkPieces/Samples", 0.02);
		}, {
			d.postln;
			SCLOrkSamples.gui;
		});
	};


	// ==========
	// BUTTON 3
	// ==========

	buttonArray[2].states = [ ["SCLOrkSynths"] ];
	buttonArray[2].action = {
		if( SCLOrkSynths.isLoaded, {
			SCLOrkSynths.gui;
		}, {
			SCLOrkSynths.load;
		})
	};



	// ==========
	// BUTTON 4
	// ==========

	buttonArray[3].states = [ ["SCLOrkChat"] ];
	buttonArray[3].action = {
		if( ~myName == "bruno", {

			~myClient = SCLOrkChatClient.new(
				serverAddress: "cmn17.stanford.edu",
				serverPort: 61010
			);

			SCLOrkChat.new(~myName.asString, true, ~myClient);

			"LOGGED IN AS CONDUCTOR".postln;

		}, {
			SCLOrkChat.new(~myName.asString)
		});

		Window.allWindows.do({ |w|
			if(w.name.find("SCLOrkChat").notNil,
				{
					w.bounds = Rect(
						left: Window.screenBounds.width - 550,
						top: Window.screenBounds.height - 333,
						width: 350,
						height: 333
					)
				},
				{ nil }
			)
		});
	};


	// ==========
	// BUTTON 5
	// ==========

	buttonArray[4].states = [ ["Reset"] ];
	buttonArray[4].action = {
		{
			Ndef.clear;
			1.wait;
			CmdPeriod.run;
			"Cleared all Ndefs, auto Ctrl+Period".postln;
			1.wait;
			~sclorkResetFunction.value;
		}.fork(AppClock);
	};



	// ==========
	// BUTTON 6
	// ==========

	buttonArray[5].states = [ ["LinkClock GUI"] ];
	buttonArray[5].action = {

		var win = Window("LinkClock", Rect(200, 200, 500, 100)).front,
		peersBox, tempoBox, barsBox, beatsBox,
		font = Font.default.copy.size_(32),
		boldFont = font.boldVariant,
		controller, task;

		win.alwaysOnTop = true;

		win.layout = HLayout(
			StaticText().font_(font).string_("Peers:"),
			peersBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80),
			StaticText().font_(font).string_("Tempo:"),
			tempoBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(120),
			StaticText().font_(font).string_("Now:"),
			barsBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80),
			beatsBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80)
		);

		[peersBox, barsBox, beatsBox].do { |view| view.enabled_(false) };

		tempoBox.action = { |view| p.clock.tempo = view.value / 60 };
		tempoBox.value = p.clock.tempo * 60;
		peersBox.value = p.clock.numPeers;

		task = Routine {
			var bars, beats;
			loop {
				bars = p.clock.bar;
				beats = p.clock.beatInBar;
				{
					barsBox.value = bars;
					beatsBox.value = beats + 1;
				}.defer(p.clock.latency);
				1.0.wait;
			}
		}.play(p.clock, quant: 1);

		controller = SimpleController(p.clock)
		.put(\tempo, {
			defer { tempoBox.value = p.clock.tempo * 60 }
		})
		.put(\numPeers, {
			defer { peersBox.value = p.clock.numPeers }
		})
		.put(\stop, { defer { win.close } });

		win.onClose = { task.stop; controller.remove };

		CmdPeriod.add( { win.close } );

	};



	// ==========
	// BUTTON 7
	// ==========

	buttonArray[6].states = [ ["Meter"] ];
	buttonArray[6].action = {
		var meterIsOpen = false, pos = 0;

		// check if a meter is already open; do nothing if yes
		Window.allWindows.do({ |w|
			if(w.name.find("localhost").notNil,
				// if open, give a warning
				{ meterIsOpen = true; "meter already open".postln; w.front }
			);
		});

		// if not open, open it
		if(meterIsOpen.not, {
			"opening Meter window".postln;
			s.meter;

			// "checking buttons position".postln;
			Window.allWindows.do({ |buts|
				if(buts.name=="SCLOrk Buttons",
					{
						pos = buts.bounds.top + 100;
					}
				);
			});

			Window.allWindows.do({ |now|
				if(now.name.find("localhost").notNil,
					{
						now.setTopLeftBounds(Rect(0, pos)).alwaysOnTop_(true);
					}
				);
			});

		}); // end of if
	}; // end of button function




	// ==========
	// BUTTON 8
	// ==========

	buttonArray[7].states = [ ["Update SCLOrk"] ];
	buttonArray[7].action = {

		// Update only SCLOrk stuff
		[
			"SCLOrkTools",
			"SCLOrkSynths",
			"SCLOrkPieces"
		].do({ |name|
			if( Quarks.isInstalled(name), {
				("Updating " ++ name ++ "...").postln;
				Quarks.update(name);
			});
		});

		"Finished updating Quarks.".postln;

		"Now copying latest Startup File to the right place...".postln;

		(Quarks.folder +/+ "SCLOrkPieces/Settings/Move-Startup-File-To-Right-Place.scd").load;

	};


	// ==========
	// BUTTON 9
	// ==========

	buttonArray[8].states = [ ["Demos"] ];
	buttonArray[8].action = {

		var win, selectButtons;
		var demos = PathName.new(Quarks.folder +/+ "SCLOrkPieces/Demos").files;

		win = Window.new(
			name: "Open Demo",
			bounds: Rect.aboutPoint(Window.screenBounds.center, 120, 100)
		);

		selectButtons = demos.collect { |path|
			Button.new(parent: win)
			.states_([[path.fileName]])
			.action_({
				Document.new(
					title: path.fileNameWithoutExtension.asString ++ " copy",
					string: String.readNew(File.new(path.fullPath, "r"));
				).front;
				win.close
			})
		};

		win.layout = VLayout(*selectButtons);
		win.front;
	};

	// ==========
	// BUTTON 10
	// ==========

	buttonArray[9].states = [ ["Nano"] ];
	buttonArray[9].action = {
		"Connecting Korg nanoKONTROL2...".postln;

		MIDIClient.init;
		MIDIIn.connectAll;
		// MIDIFunc.trace(true);
		// MIDIFunc.trace(false);

		~nK2srcID = MIDIIn.findPort("nanoKONTROL2", "nanoKONTROL2 nanoKONTROL2 _ CTR").uid;

		~nano = (
			device: NanoKONTROL2(
				server: s,
				srcID: ~nK2srcID,
				num_of_scenes: 1
			),
			knob: { | self, num, lo, hi, int = \lin |
				var x = self.device.knobs[0][num-1].kr;
				case
				{ int == \lin } { x.range(lo, hi) }
				{ int == \exp } { x.exprange(lo.max(0.0001), hi) }
			},
			fader: { | self, num, lo, hi, int = \lin |
				var x = self.device.faders[0][num-1].kr;
				case
				{ int == \lin } { x.linlin(0, 1, lo, hi) }
				{ int == \exp } { x.linexp(0, 1, lo.max(0.0001), hi) }
			}
		);

		"//============= \nnanoKONTROL2 usage inside any Ndef: \n//=============".postln;
		"".postln;
		"    ~nano.knob(1, 50, 1000)\n".postln;
		"// this makes knob #1 to provide \n// kr values between 50 and 1000".postln;
		"".postln;
		"    ~nano.fader(2, 0.1, 1.5, \\exp)\n".postln;
		"// this makes fader #2 to provide \n// kr values between 0.1 and 1.5 with \nexponential mapping".postln;
		"".postln;

	};


	// ===========================================
	// Place all buttons vertically in Window
	// ===========================================

	buttonArray.do({ arg b;
		window.layout.add(
			item: b,
			stretch: 4,
			// align: \center
		)
	});


	window.front;







	// *********************
	// BOOT SERVER
	// *********************

	s.options.numBuffers = 3000; // to accommodate Dirt samples
	s.options.memSize = 8192 * 100; // just in case
	s.waitForBoot {
		s.sync;


		// create two basic SynthDefs to handle playing Dirt Samples (or any samples really)
		// need two to accommodate mono or stereo samples

		[1, 2].do({ |n|

			var name = (\pb ++ n).asSymbol;
			SynthDef(name, {
				arg out=0, amp=0.2, rate=1, buf, pan=0, loop=1;
				var snd, env;
				env = Env.linen(
					attackTime: 0,
					sustainTime: BufDur.kr(buf) / rate.abs - 0.01,
					releaseTime: 0.01
				).kr(doneAction: 2);
				snd = PlayBuf.ar(
					numChannels: n,
					bufnum: buf,
					rate: BufRateScale.kr(buf) * rate,
					loop: loop
				);
				if(n==1, {
					// if a mono sample
					snd = Pan2.ar(snd, pan);
				}, {
					// else, if a stereo sample
					snd = Balance2.ar(snd[0], snd[1], pan);
				});
				snd = snd * amp * env;
				Out.ar(out, snd);
			}).add;
		});

		// Load basic utilities now (Ndef tempo, ~bpm, ~freeAll.(), etc)
		~sclorkResetFunction.value;

	};



	if( Quarks.isInstalled("ddwSnippets"), {
		(Quarks.folder +/+ "SCLOrkPieces/Settings/ddwSnippets.scd").load;
		"ddwSnippets added. Try Control + ` to use them!".postln;
	}, {
		"ddwSnippets Quark not installed. No shortcuts added.".postln;
		"If you wish to use ddwSnippets, please run:".postln;
		"Quarks.install(\"ddwSnippets\");".postln;
	}); // end of ddwSnippets if/else


	// utility function to open a copy of a file (not the original)

	~openCopy = { arg path;
		path = PathName.new(path);
		Document.new(
			title: path.fileNameWithoutExtension.asString ++ " copy",
			string: String.readNew(File.new(path.fullPath, "r"));
		).front;
	};


}; // end of loginWindow.onClose

