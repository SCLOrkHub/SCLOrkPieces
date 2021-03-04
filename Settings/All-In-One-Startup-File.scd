//
// SCLOrk All In One Startup File
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
































var textField, loginWindow, requiredQuarks, currentPiece, pipe;

// get this computer's hostname to use with jacktrip (or anything else)
pipe = Pipe.new("hostname", "r");
~hostname = pipe.getLine;
pipe.close;

requiredQuarks = [
	"SafetyNet",
	"HyperDisCo",
	"StartupFile",
	"SCLOrkTools",
	"SCLOrkSynths",
	"SCLOrkPieces",
	"Dirt-Samples",
	"ddwSnippets"
];

loginWindow = Window.new(
	name: "please type your name or nickname (a single word)",
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

	"*** SCLOrk ALL IN ONE Startup File"
	"*** loading startup file.".postln;


	/// make a dictionary for keeping things around by name:
	q = q ? ();

	/// preferred nametag/ID:
	q.myID = ~myName;

	/// a personal password for yourself - don't use an important one!
	q.mypassword = 'hyperdisco25';

	// tell the setup where the HyperDisco folder is
	// Let's try with NO HYPERFOLDER AT ALL
	// BRING ALL STUFF INTO THIS FILE INSTEAD
	// q.hyperfolder = Quarks.folder +/+ "SCLOrkPieces/Blank" +/+ "hyperBlank";

	// this is the server adress which connects the group:
	q.myoscserver = "cmn17.stanford.edu";

	q.mygroup = 'hyperdisco25';
	q.mygroupPassword = 'hyperdisco25';



	///////////////// END of PERSONALIZATION !////////////////////

	//////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////

	//////////////// DONT CHANGE ANYTHING BELOW HERE!!! //////////
	if (q.myID == '???') {
		"*** please enter your nametag!"
		"\n... stopping here.".postln;
		this.halt;
	};

	"***  q.myID = %; // <- My valid nameID \n\n".postf(q.myID);

	/*
	if (File.exists(q.hyperfolder).not) {
	"cannot find q.hyperfolder at % - "
	"\n please move it there!".postf(q.hyperfolder);
	this.halt;
	};
	// found it:
	"***  q.hyperfolder = %; ".postf(q.hyperfolder);
	*/

	MFdef(\quarksCheck).add(\quarks, {
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
		})
	});

	MFdef(\quarksCheck).value;

	if( Quarks.installed.any({ |quark| quark.name == "HyperDisCo" }).not,
		// if HyperDisCo is not installed, install it and throw warning:
		{
			// if missing, add quark folder, and recompile by Hand:
			"Cannot proceed without HyperDisCo".postln;
			// LanguageConfig.store;
		}, {
			// if HyperDisCo is installed, continue:
			// (q.hyperfolder +/+ "setup_files/00_loadMe.scd").loadPaths;

			// ****************
			// MAKE HISTORY
			// ****************

			// previously in a separate file:
			// (q.hyperfolder +/+ "setup_files/2_makeHistory.scd").loadPaths;

			// start recording all code evaluations into History:
			q.postHistory = false;

			OSCdef(\history, { |msg ... args|
				var nameID = msg[1];
				var codeString = msg[2].asString;
				var shoutString;
				History.enter(codeString, nameID);
				if (q.postHistory) {
					"history message received from % \n".postf(nameID.cs);
					codeString.postcs;
				};
				//
				if (codeString.beginsWith(NMLShout.tag)) {
					shoutString = codeString.split("\n").first.drop(4);
					////// anonymity or better not?
					shoutString = "% : %".format(nameID, shoutString).postln;
					defer { NMLShout(codeString) };
				};
			}, \history).permanent_(true);

			// OSCdef(\history).enable at end of startup!
			OSCdef(\history).disable;


			// better History setup - only nonGUI functions here:
			/// Use a Modal function, an MFdef for forwarding:
			MFdef('historyForward').add('share', { |code, result|
				"send code to shared history ...".postln;
				q.oscRouter.sendMsg(\history, q.myID, code);
			}, false);
			MFdef('historyForward').add('do_it', { |code, result|
				"send code to run everywhere ...".postln;
				q.oscRouter.sendMsg(\do_it, q.myID, code);
			}, false);

			// add Shouting to History forwarding
			// lines that begin with //!! get shouted - test:
			//!! Hello World!
			MFdef('historyForward').add(\shout, { |code, result|
				if (code.beginsWith(NMLShout.tag)) {
					NMLShout(q.myID.asString ++ ":" + code.drop(4).split("\n").first)
				}
			});

			History.forwardFunc = MFdef('historyForward');


			MFdef(\setHistSend).add(\but, { |butOrValue = 1|
				if (butOrValue.value > 0) {
					"sharing code to history is ON now".postln;
					MFdef(\historyForward).enable(\share);
					if (History.started.not) { History.start };
				} {
					"sharing code to history is OFF now".postln;
					MFdef(\historyForward).disable(\share)
				};
			});

			MFdef(\setHistAccept).add(\but, { |butOrValue = 1|
				if (butOrValue.value > 0) {
					"accepting code for history is ON now".postln;
					OSCdef(\history).enable;
					if (History.started.not) { History.start };
				} {
					"accepting code for history is OFF now".postln;
					OSCdef(\history).disable
				}
			});

			MFdef(\setRunSend).add(\but, { |butOrValue = 1|
				if (butOrValue.value > 0) {
					"sending code to run is ON now".postln;
					MFdef(\historyForward).enable(\do_it);
					if (History.started.not) { History.start };
				} {
					"sending code to run is OFF now".postln;
					MFdef(\historyForward).disable(\do_it);
				}
			});

			MFdef(\setRunAccept).add(\but, { |butOrValue = 1|
				if (butOrValue.value > 0) {
					"accepting code to run is ON now".postln;
					MFdef(\do_it).enable('runCode');
					if (History.started.not) { History.start };
				} {
					"accepting code to run is OFF now".postln;
					MFdef(\do_it).disable('runCode');
				}
			});

			MFdef(\PRIVATE).add('set', {
				[
					MFdef(\setHistSend),
					MFdef(\setHistAccept),
					MFdef(\setRunSend),
					MFdef(\setRunAccept)
				].do(_.value(0));
			});
			MFdef('PUBLIC').add('set', {
				[
					MFdef(\setHistSend),
					MFdef(\setHistAccept),
					MFdef(\setRunSend),
					MFdef(\setRunAccept)
				].do(_.value(1));
			});


			"END OF MAKE HISTORY".postln;

			// ^^^^^^^^^^^^^^^^^^^^^
			// END OF MAKE HISTORY





			// ****************
			// LOAD BUTZ
			// ****************
			// (q.hyperfolder +/+ "setup_files/1a_Butz.scd").loadPaths;


			//////// Buttons for useful functions like this:

			Butz.clear;
			Butz.numButz = 20;
			Butz.style.font_(Butz.style.font.size_(14));
			try { Butz.w.close };
			Butz.makeWin;
			Butz.w.layout.margins = [4, 4, 4, 4];
			Butz.w.layout.spacing_(2);
			Butz.w.moveTo(0, 0);


			///// make all button names here first, in the desired order.
			///// put simple actions in directly;
			///// put more complex actions in as MFdef(name) or WinBounds.showOrMake(name);
			///// and fill those functions later.

			// custom buttons

			Butz.add(~myName.asSymbol, {
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
			});

			Butz.add('   -   ', { "this is just a space divider" });

			Butz.add('Dirt Samples', {
				if( d.isNil, {
					d = SCLOrkSamples.loadFolder(Quarks.folder +/+ "Dirt-Samples");
				}, {
					d.postln;
					SCLOrkSamples.gui;
				});
			});

			Butz.add('SCLOrkSynths', {
				if( SCLOrkSynths.isLoaded, {
					SCLOrkSynths.gui;
				}, {
					SCLOrkSynths.load;
				})
			});

			Butz.add('SCLOrkChat', {
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

				Window.find("SCLOrkChat").bounds = Rect(
					left: Window.screenBounds.width - 550,
					top: Window.screenBounds.height - 333,
					width: 550,
					height: 333
				)
			});

			Butz.add('Load All The Rest', {

				// Clear all
				Ndef.clear;
				"Cleared all Ndefs".postln;

				// Create general purpose clock that Ndefs can use;
				// Also quants all proxies to 1 beat
				// Default BPM is 60, can be changed later using custom function
				// shortcut to change bpm will be ~bpm.(120)
				p = Ndef(\tempo).proxyspace.makeTempoClock(60/60).quant_(1.0);

				// Create convenience "Impulse metronome" Ndef
				Ndef(\t, { Impulse.ar(Ndef(\tempo)) }); // we'll use Ndef(\t) to get a trigger on the clock

				"Metronome running at 60 BPM.".postln;
				"Global quantization set to 1 beat.".postln;

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

				currentEnvironment.pairsDo({ |k, v| [k, v].postln });

				"Utility Functions loaded".postln;

				// If there is need to load other files, place them here?
				// likely will save those files 'per piece' in their own folder
				// folder should be inside SCLOrkPieces
				// so we need a way here to define which piece we are loading
				// maybe a butz that functions as 'piece picker'
				// assuming all these settings in startup file will be identical between pieces, the piece picker would load only additional settings for a piece (hopefully clean up as blank slate before loading).
				// if hard clean up is needed, players should just recompile
				//
				// (q.hyperfolder +/+ "customWhatever.scd").load;
				// chat score messages...
				// custom synthdefs...
				// custom snippets
				// etc
			});

			// this button needs to be reinvented.
			// if there is a global variable like ~currentPiece, then my scd file could try to open a file inside that pieces' folder with the username.
			// or maybe just let the user defeine which file they want to open
			// or maybe just don't have a button like this one at all

			/*
			Butz.add('my scd file', {
			try({ (
			PathName(q.hyperfolder).parentPath
			++
			~myName.asString
			++
			".scd"
			).openDocument;
			},
			{ "***oops -- are you sure your nickname matches your scd file?".postln; }
			);
			});

			*/

			Butz.add(' - ', { "this is just a space divider" });


			// All pieces will have this (as long as we are in COVID mode)
			Butz.add('PUBLIC', MFdef('PUBLIC'));
			Butz.add('PRIVATE', MFdef('PRIVATE'));

			// switches colors to clearly indicate when we are PUBLIC
			MFdef('PUBLIC').add(\winColor, { Butz.w.background_(Color.black) });
			MFdef('PRIVATE').add(\winColor, { Butz.w.background_(Color.red) });

			Butz.add('  -  ', { "this is just a space divider" });

			// Consider having more than one SyncText "room"
			Butz.add('SyncText', MFdef(\SyncText) );

			/*
			Butz.add('StartupFile', {
			if( (try { StartupFile.select }).isNil, { StartupFile.choose });
			});
			*/

			Butz.add('Post Peers', {
				var peers = q.oscRouter.peers;
				"*** q.oscRouter has % peers: \n%\n".postf(peers.size, peers.sort)
			});

			Butz.add('History', { WinBounds.showOrMake('sharedHistory') });


			Butz.add('Meter', {
				// s.meter.window.close;
				WinBounds.showOrMake(\meter);
				Window.find(\meter).moveTo(120, 0);
			});

			WinBounds.addMake(\meter, {
				var w;
				w = s.meter.window;
				w.name_(\meter);
				w.alwaysOnTop_(true);
				w;
			});

			MFdef(\quarksCheck).add('update', {
				// Update only SCLOrk stuff
				// (avoid unexpected HyperDisCo updates for example)
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
			});

			Butz.add('Update SCLOrk', {
				MFdef(\quarksCheck).value;
				"Finished updating Quarks.".postln;
				"Now copying latest Startup File to the right place...".postln;
				(Quarks.folder +/+ "SCLOrkPieces/Settings/Move-Startup-File-To-Right-Place.scd").load;
			});

			Butz.add('NdefAuditioner', { (Quarks.quarkNameAsLocalPath("SCLOrkPieces") ++ "/Settings/Ndef-Auditioner.scd").load });

			// Butz.add('NdefAuditioner', { WinBounds.showOrMake(\ndefmix) });
			/*WinBounds.addMake(\ndefmix, {
				var mixer;
				mixer = NdefMixer(s, 24);
				mixer.parent.name_(\ndefmix);
				ProxyMeter.addMixer(mixer);
				mixer.parent;
			});
*/

			Butz.add('Load New Piece', {
				var win, selectButtons;
				var pieces = [
					"20x20",
					"Toccata",
					"GMO (Ndef improv)",
					"Wherever We Are",
					"Another piece goes here 1",
					"Another piece goes here 2",
					"Another piece goes here 3"
				];

				win = Window.new(
					name: "Select a piece to load",
					bounds: Rect.aboutPoint(Window.screenBounds.center, 200, 200)
				);

				selectButtons = pieces.collect { |name|
					var color = if(name == currentPiece, { Color.green });
					Button.new(parent: win)
					.states_([[name, nil, color]])
					.action_({
						switch(name,
							"20x20", {
								"Loading 20x20...".postln;
								(Quarks.folder +/+ "SCLOrkPieces/20x20/20x20_Setup.scd").load;
							},
							"Toccata", {
								var path = PathName.new(Quarks.folder +/+ "SCLOrkPieces/Toccata/TOCCATA_PLAYER_JULY_2020.scd");
								Document.new(
									title: path.fileNameWithoutExtension.asString ++ " copy",
									string: String.readNew(File.new(path.fullPath, "r"));
								).front;
					},
							"GMO (Ndef improv)", {
								var path = PathName.new(Quarks.folder +/+ "SCLOrkPieces/Demos/Ndef/Basic-HyperSCLOrk.scd");
								Document.new(
									title: path.fileNameWithoutExtension.asString ++ " copy",
									string: String.readNew(File.new(path.fullPath, "r"));
								).front;
					},
							"Wherever We Are", {
								"Loading WWA".postln;
							}
						);
						currentPiece = name;
						win.close
					})
				};

				win.layout = VLayout(*selectButtons);
				win.front;
			});



			Butz.add('Demos', {

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
			});




			// Not in use:

			// Butz.add(\DRAW, { WinBounds.showOrMake(\DRAW) });
			// Butz.add('MFdef_draw', { WinBounds.showOrMake('MFdef_draw') });
			// Butz.add('scope', { WinBounds.showOrMake(\scope) });

			// Butz.add('recSetup', MFdef('recSetup'));
			// Butz.add('record', { s.record });
			// Butz.add('stopRec', { s.stopRecording });

			/*
			Butz.add(\MainFX, { WinBounds.showOrMake(\MasterFX) });
			WinBounds.addMake(\MasterFX, { MasterFX(s).gui.parent.name_(\MasterFX) });



			MFdef('recSetup').add(\makeDoc, {
			Document("myRecSetup", [
			"/**** ",
			"for sharing recordings, convert to mp3 files (192 kbps),",
			"and upload them to HyperDisCo_shared!",
			"****/",
			"",
			"// my recording setup - recordings go here:",
			"Platform.recordingsDir = %;".format(Platform.recordingsDir.cs),
			"Platform.recordingsDir.openOS;",
			"",
			"// other record settings:",
			"s.recChannels_(%);".format(s.recChannels.cs),
			"/// one of: 'wav', 'aiff', (on macOS also:), 'caf'",
			"s.recHeaderFormat_(%);".format("wav"),
			"/// one of: 'int16', 'int24', , 'float'",
			"s.recSampleFormat_(%);".format(s.recSampleFormat.cs),
			].join("\n")
			);
			nil;
			});

			WinBounds.addMake(\scope, {
			var w = s.scope.window;
			w.name_(\scope);
			});
			*/

			"END OF LOAD BUTZ".postln;
			// ^^^^^^^^^^^^^^^^^^^^^
			// END OF LOAD BUTZ




			// ****************
			// WINBOUNDS
			// ****************
			// (q.hyperfolder +/+ "setup_files/1b_winbounds.scd").loadPaths;

			/***
			// STORE LAYOUT WITH:
			WinBounds.storeAll;
			WinBounds.saveString;
			***/
			WinBounds.stored.putAll( (
				'Butz': Rect(500.0, 439.0, 123.0, 566.0),
				'sharedHistory': Rect(270.0, 35.0, 314.0, 413.0),
				// 'ndefmix': Rect(580, 23.0, 684.0, 489.0),
				// 'Tdef.all': Rect(270.0, 491.0, 274.0, 514.0),
				// 'Pdef.all': Rect(540, 491.0, 274.0, 514.0),
				// 'DRAW': Rect(270.0, 324.0, 938.0, 681.0),
				// 'MFdef_draw': Rect(120, 479.0, 147.0, 526.0),
				// 'scope': Rect(2.0, 10, 260.0, 320),
				'meter': Rect(0.0, 180.0, 134.0, 230.0)
			) );

			// WinBounds.restoreAll;


			"END OF WINBOUNDS".postln;
			// ^^^^^^^^^^^^^^^^^^^^^
			// END OF WINBOUNDS




			// ****************
			// MAKE HISTORY GUI
			// ****************
			// (q.hyperfolder +/+ "setup_files/2b_makeHistoryGUI.scd").loadPaths;

			// better History setup:

			// make a window for history
			// comment out so the window does not open by default
			// defer ({ WinBounds.showOrMake('sharedHistory') }, 0.1);


			MFdef(\updateShareButs).add(\buts, {
				var funcvals = [
					MFdef(\historyForward).activeNames.includes(\share),
					OSCdef(\history).enabled,
					MFdef(\historyForward).activeNames.includes(\do_it),
					MFdef(\do_it).activeNames.includes('runCode')
				].collect(_.binaryValue);
				defer {
					q.sharebuts.do { |but, i|
						if (but.value != funcvals[i]) {
							but.value = funcvals[i]
						};
					}
				};
			});

			MFdef(\updateShareButs).value;

			WinBounds.addMake('sharedHistory', {
				var g = History.makeWin;
				g.parent.name = 'sharedHistory';
				g.zone.bounds = g.zone.bounds.moveBy(0, 60);
				g.listV.bounds = g.listV.bounds.height_(g.listV.bounds.height - 60);
				g.parent.view.decorator.reset;

				q.histgui = g;
				q.sharebuts = [
					[
						["send code 2 history OFF"],
						["send code 2 history ON"],
						MFdef(\setHistSend)
					],
					[
						["accept code 4 hist OFF"],
						["accept code 4 hist ON"],
						MFdef(\setHistAccept),
					],
					[
						["send code 2 run OFF"],
						["send code 2 run ON"],
						MFdef(\setRunSend),
					],
					[
						["accept code 2 run OFF"],
						["accept code 2 run ON"],
						MFdef(\setRunAccept),
					]
				].collect { |list, i|
					Button(g.parent,
						Rect(0,0,150,25))
					.states_([
						list[0] ++ [ nil, Color.grey (0.9) ],
						list[1] ++ [ nil, Color.green(0.9) ]
					])
					.action_(list[2])
				};

				// watch for state changes
				q.histSkip.stop.free;
				q.histSkip = SkipJack(MFdef(\updateShareButs), 0.2, { g.parent.isClosed });
				q.histSkip.start;

				// return the parent window
				g.parent;
			});

			"END OF MAKE HISTORY GUI".postln;
			// ^^^^^^^^^^^^^^^^^^^^^
			// END OF MAKE HISTORY GUI





			// ****************
			// LOG ME IN
			// ****************

			// this may be too harsh - comment out if not needed!
			Server.killAll;

			Routine {
				try {

					if( (q.myID == '???'), {
						"*** cannot log in as  '???'!"
						"\n*** STOPPING HERE!"
						"\nplease set q.myID to your nameID first.".postln;
						this.halt
					}, {
						"logging in now as % \n".postf(q.myID.cs);

						// make a new OscRouterClient,
						// and log in with name and pw,
						q.oscRouter = OSCRouterClient.new(
							q.myID, q.mygroup,
							serverAddr: q.myoscserver,
							userPassword: q.mypassword,
							groupPassword: q.mygroupPassword,
							serverPort: 61999 // PICKED BY BRUNO FOR CCRMA CMN17
						);

						q.oscRouter.join(
							onSuccess: { "*** Connected to %!\n".postf(q.myoscserver) },
							onFailure: { "*** UNABLE TO CONNECT TO %!\n".postf(q.myoscserver) }
						);
					});

				} {
					"*** LOG ME IN failed!".postln;
				};

				"END OF LOG ME IN".postln;
				// ^^^^^^^^^^^^^^^^^^^^
				// END OF LOG ME IN


				1.wait;


				// *********************
				// RUN CODE EVERYWHERE
				// *********************
				// (q.hyperfolder +/+ "setup_files/3_runCode*.scd").loadPaths;



				q = q ? ();
				q.oscRouter = q.oscRouter ? ();

				MFdef('historyForward').add('do_it', { |code, result|
					"send code to run everywhere ...".postln;
					q.oscRouter.sendMsg(\do_it, q.myID, code);
				});

				MFdef('historyForward').disable('do_it');

				History.forwardFunc = MFdef('historyForward');

				/*
				// now you can turn sharing to history on/off:
				MFdef('historyForward').enable(\add2Hist);
				MFdef('historyForward').disable(\add2Hist);

				// and sending all others to run your code
				MFdef('historyForward').enable(\do_it);
				MFdef('historyForward').disable(\do_it);
				*/


				/*
				MFdef(\do_it).(['/do_it', 'adc', '(1 + 2).postln']);
				MFdef(\do_it).(['/do_it', 'adc', '(1 + 2.gargle).postln;']);
				MFdef(\do_it).(['/do_it', 'adc', 'unixCmd(\"say what?\").postln;']);
				*/

				q.postRunCode = false;

				MFdef(\do_it).add('runCode', { |msg|
					var who = msg.postcs[1].asString;
					var code = msg[2].asString;

					var isSafe = {
						// code from OpenObject avoidTheWorst method
						code.find("unixCmd").isNil
						and: { code.find("systemCmd").isNil }
						and: { code.find("File").isNil }
						and: { code.find("Pipe").isNil }
						and: { code.find("Public").isNil }
					}.value;

					isSafe.if {
						// defer it so GUI code also always runs
						defer {
							try {
								"do_it: interpreting code ...".postln;
								if (q.postRunCode) { code.postcs };
								code.interpret
							} {
								(
									"*** q.oscRouter do_it - code interpret failed:".postln;
									code.cs.keep(100).postln;
								).postln
							}
						}
					} {
						"*** q.oscRouter do_it unsafe code detected:".postln;
						code.postcs;
					}
				});

				MFdef(\do_it).enable('runCode');
				MFdef(\do_it).disable('runCode');

				//////// use this MFdef for the OSCFunc listener as well
				q.oscRouter.addResp(\do_it, MFdef(\do_it));


				"END OF RUN CODE EVERYWHERE".postln;
				// ^^^^^^^^^^^^^^^^^^^^
				// END OF RUN CODE EVERYWHERE










				// *********************
				// MAKE SYNCED EDITOR
				// *********************

				// this could be problematic,
				if (Platform.hasQt) {

					// one single SyncText per textID:
					q.syncText = SyncText(\syncText, q.myID, q.oscRouter);

					MFdef(\SyncText).add(\show, {
						if (q.syncText.currText.isNil) {
							q.syncText.requestText
						};
						"q.syncText.showDoc".postln;
						defer { q.syncText.showDoc };
					});
				};

				"END OF MAKE SYNCED EDITOR".postln;

				// ^^^^^^^^^^^^^^^^^^^^
				// END OF MAKE SYNCED EDITOR






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


					// if we ever use main fx, add here?
					// (q.hyperfolder +/+ "setup_files/6_HyperMasterFX.scd").loadPaths;
				};

			}.play(AppClock);



			if( Quarks.isInstalled("ddwSnippets"), {
				(Quarks.folder +/+ "SCLOrkPieces/Settings/ddwSnippets.scd").load;
				"ddwSnippets added. Try Control + ` to use them!".postln;
			}, {
				"ddwSnippets Quark not installed. No shortcuts added.".postln;
				"If you wish to use ddwSnippets, please run:".postln;
				"Quarks.install(\"ddwSnippets\");".postln;
			}); // end of ddwSnippets if/else


	}); // end of Quark installation if/else
}; // end of loginWindow.onClose

