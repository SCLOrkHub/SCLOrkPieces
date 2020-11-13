// kind of working
// needs more testing

/*
for example, possibly a bug:

1. play some ndefs
2. open auditioner
3. close it
4. add another ndef (play? stop? just add?)
5. open auditioner
OTHER NDEFS DO NOT PLAY AT THIS POINT
6. close auditioner
7. open again
ALL NDEFS NOW PLAY
*/

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
		.action_({ auditionButtons.keysValuesDo({ | k, v | v.valueAction = 1 }) }),
		Button().states_([["audition all"]])
		.action_({ auditionButtons.keysValuesDo({ | k, v | v.valueAction = 0 }) }),
	);
);

{
	group = Group.after(s.defaultGroup).register;
	// Create a stereo ProxySubMix

	ProxySubmix(\audition).ar(2);
	Ndef(\replaceOut).ar(2);

	0.5.wait; // for some reason needed

	ProxySubmix(\audition).parentGroup_(group);
	Ndef(\replaceOut).parentGroup_(group);

	Ndef(\replaceOut).bus = Bus(\audio, 0, 2, s);

	Ndef(\replaceOut, { ReplaceOut.ar(0, ProxySubmix(\audition)) }).fadeTime_(2);

	Ndef(\replaceOut).play;
}.fork;

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
		ndefsToAdd.remove('audition');
		ndefsToAdd.remove('replaceOut');
		ndefsToAdd.remove('t');
		ndefsToAdd.remove('tempo');

		// Remove any that were already added
		ndefsToAdd = ndefsToAdd.difference(ndefsAlreadyAdded);

		// update this variable now for next turn
		ndefsAlreadyAdded = (ndefsAlreadyAdded ++ ndefsToAdd).asList;

		// Create / update auditionButtons dictionary
		ndefsToAdd.do({ | name |
			if( auditionButtons.includesKey(name).not, {
				auditionButtons.put(
					key: name,
					value: Button()
					.states_([["auditioning...", nil, Color.green], ["audition"]])
					.action_({ |b|
						var sendName = ("snd_" ++ name).asSymbol;
						switch(b.value,
							0, { Ndef(\audition).set(sendName , 1) },
							1, { Ndef(\audition).set(sendName , 0) }
						);
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

		// Iterate through ndefsToAdd to add them to submix:
		// (double check for repeats before adding just in case)
		ndefsToAdd.do({ | name |
			if( ProxySubmix(\audition).proxies.notNil
				and: try { ProxySubmix(\audition).proxies.includes(Ndef(name)) },
				{
					[name, "already included in submix"].postln;
				}, {
					ProxySubmix(\audition).addMix(
						proxy: Ndef(name.asSymbol),
						sendLevel: 1,
						postVol: false
					);
			});
		});

		// (re-)Create ReplaceOut "effect" - it overwrites regular output from Ndefs and auditions the ProxySubmix instead:
		// try{ Ndef(\replaceOut).free };

		2.wait;
	}.loop;
}).play(AppClock);

// When window is closed, revert to full ensemble mix
window.onClose = {
	"Ndef Auditioner closed".postln;
	group.free;
	Ndef(\replaceOut).clear;
	"Back to full ensemble mix".postln;
	refresh.stop;
};


}, {
	"NdefAuditioner already open!".postln;
}); // end of IF