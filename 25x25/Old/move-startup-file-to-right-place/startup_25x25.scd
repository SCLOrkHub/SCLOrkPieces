// SCLOrk 25x25 startup file
// NOTE: this file must be located under
// ~/.config/SuperCollider/startup_files/




// Don't touch anything below this line...





var a, w;

w = Window.new(
	name: "please type your name or nickname (a single word)",
	bounds: Window.screenBounds,
	resizable: false
).front;
w.background = Color.black;
a = TextField(
	parent: w,
	bounds: Rect(
		left: Window.screenBounds.width / 2 - 150,
		top: Window.screenBounds.height / 2 - 100,
		width: 300,
		height: 100
	)
);
a.font = Font("Arial", 40);
a.string = "your name?";
a.align = \center;
a.stringColor = Color.gray;
a.mouseDownAction = { a.string = "" };
a.keyDownAction = { a.string = ""; a.keyDownAction = nil };
a.action = {arg field; ~myName = field.value.postln; w.close };


w.onClose = {

	"*** 25x25 by SCLOrk - Fall 2020"
	"*** loading startup file.".postln;


	/// make a dictionary for keeping things around by name:
	q = q ? ();

	/// preferred nametag/ID:
	q.myID = ~myName;

	/// a personal password for yourself - don't use an important one!
	q.mypassword = 'hyperdisco25';

	// tell the setup where the HyperDisco folder is
	q.hyperfolder = "~/Music/SCLOrk/25x25/".standardizePath ++ "hyperfolder25x25";

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
		"*** please enter your nametag in your startup file!"
		"\n... stopping here.".postln;
		this.halt;
	};

	"***  q.myID = %; // <- My valid nameID \n\n".postf(q.myID);

	if (File.exists(q.hyperfolder).not) {
		"cannot find q.hyperfolder at % - "
		"\n please move it there!".postf(q.hyperfolder);
		this.halt;
	};
	// found it:
	"***  q.hyperfolder = %; ".postf(q.hyperfolder);

	if ((Quarks.installed.any { |quark| quark.name == "HyperDisCo" })) {
		// just continue
		(q.hyperfolder +/+ "setup_files/00_loadMe.scd").loadPaths;
	} {
		// if missing, add quark folder, and recompile by Hand:
		Quarks.fetchDirectory;
		Quarks.install("HyperDisCo");
		Quarks.install("StartupFile");
		LanguageConfig.store;
		"*** Please recompile now! with:".postln;
		"thisProcess.recompile;".postln;
	};
}; // end of w.onClose
