// kind of working
// needs more testing

// s.plotTree; Window.find("localhost Node Tree").alwaysOnTop_(true);

if( Window.find("NdefAuditioner").isNil, {
	var window, n = 15, ndefsAlreadyAdded = List[], ndefsToAdd = List[], auditionButtons, openButtons, refresh, group;

	// ============
	// ONLY HAPPENS WHEN WINDOW LAUNCHES
	// ============

	// Create play button dictionary
	auditionButtons = Dictionary.new;
	// Create open button dictionary
	openButtons = Dictionary.new;

	// Create new window
	window = Window.new(
		name: "NdefAuditioner",
		bounds: Rect(
			left: Window.screenBounds.width / 2,
			top: Window.screenBounds.height / 2,
			width: 100,
			height: 50
		),
		border: false
	).front.alwaysOnTop_(true);

	// Create layout
	window.layout = VLayout();

	// CLOSE button
	window.layout.add(
		HLayout(
			Button().states_([["CLOSE"]])
			.action_({ window.close; "closed".postln }),
		);
	);

	// MuteAll / AuditionAll buttons
	window.layout.add(
		HLayout(
			Button().states_([["mute all"]])
			.action_({ auditionButtons.keysValuesDo({ | k, v | v.valueAction = 0 }) }),
			Button().states_([["audition all"]])
			.action_({ auditionButtons.keysValuesDo({ | k, v | v.valueAction = 1 }) }),
		);
	);

	// ===============
	// CONTENTS OF ROUTINE WILL UPDATE EVERY X SECONDS
	// (REFRESH WHEN NEW STUFF COMES IN)
	// ==============

	refresh = Routine.new({
		{
			"WARNING: NdefAuditioner Window is active".postln;
			"You are not listening to actual ensemble mix.".postln;
			"(Close window to go back)".postln;
			"**=**==--**=**==--**=**==--".scramble.postln;

			// Get latest names for all existing Ndefs, convert into List
			ndefsToAdd = Ndef.dictFor(Server.default).arProxyNames;

			// Remove the ones we never want to audition / display
			ndefsToAdd.remove('t');
			ndefsToAdd.remove('tempo');

			// Do not re-add if already present
			ndefsToAdd = ndefsToAdd.difference(ndefsAlreadyAdded);

			// update this variable now for next turn
			ndefsAlreadyAdded = (ndefsAlreadyAdded ++ ndefsToAdd).asList;

			// Create / update auditionButtons dictionary
			ndefsToAdd.do({ | name |
				if( auditionButtons.includesKey(name).not, {
					auditionButtons.put(
						key: name,
						value: Button()
						.states_([["audition"], ["auditioning...", nil, Color.green]])
						.action_({ | button |
							[name, "buttonValue is", button.value].postln;
							Ndef(name).vol = button.value; // 0 or 1
						})
						.valueAction_(0)
					);
				}, {
					("There is already a button for " ++ name).postln;
				});
			});

			// Create / update openButtons dictionary
			ndefsToAdd.do({ | name |
				if( openButtons.includesKey(name).not, {
					openButtons.put(
						key: name,
						value: Button()
						.states_([["open"]])
						.action_({ Ndef(name).document; }));
				});
			});

			// Display / update GUI with (new) buttons
			ndefsToAdd.do({ | name |
				window.layout.add(
					HLayout(
						StaticText()
						.string_("\\" ++ name.asString)
						.background_(Color.gray(0.9))
						.align_(\center),
						auditionButtons[name],
						openButtons[name],
					);
				);
			});

			2.wait;
		}.loop;
	}).play(AppClock);

	// When window is closed, revert to full ensemble mix
	window.onClose = {
		"Ndef Auditioner closed".postln;
		"Back to full ensemble mix".postln;
		ndefsAlreadyAdded.do({ | name | Ndef(name).vol = 1 });
		refresh.stop;
	};


}, {
	"NdefAuditioner already open!".postln;
}); // end of IF