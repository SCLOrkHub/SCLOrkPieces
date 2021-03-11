// =============================
// GMO (Ndef improvisation)
// =============================

// CLEANING UP

// 1) Control Period to clean up any previous leftover synths

// 2) If you just played Toccata, close QuNeo GUI (manually, or using line below)
Window.find("SCLOrkQuNeo").close;

// 3) Red buttons: Dirt Samples, SCLOrkSynths, Reset
// (assuming SCLOrkChat and JackTrip are already running; if not, start them now)

// 4) Clean up prior jack connections:
SCLOrkJack.disconnectAll;

// 5) Redo jack connections for Ndef improv:
(
SCLOrkJack.connectAllFrom([
	// mics to jacktrip for talkback
	List[ "system:capture_1", "cmn20.stanford.edu:send_1", "cmn20.stanford.edu:send_2" ],
	List[ "system:capture_2", "cmn20.stanford.edu:send_2", "cmn20.stanford.edu:send_1" ],
	// sc direct outs to headphones 3/4
	List[ "SuperCollider:out_1", "system:playback_3" ],
	List[ "SuperCollider:out_2", "system:playback_4" ],
	// talkback listening channel on headphones 1/2
	List[ "cmn20.stanford.edu:receive_1", "system:playback_1" ],
	List[ "cmn20.stanford.edu:receive_2", "system:playback_2" ]
])
)

// (bruno only: also connect sc 1-2 to cmn17 1-2 for live stream)

// 7) NOW YOU CAN GO PUBLIC!
// (note: if you need to do any of the above again, go PRIVATE first, do what you need, then go public again)

// Scroll down for starter code.
// (or: if directed by bruno, use the last code from last time to start this one)

// NOTE: listen to SC on headphones 3/4, and talkback mic on headphones 1/2







// ++ code copied from bruno
(
// remember to change name!!!!!!!!!!!!!
Ndef(\bruno).fadeTime = 10;
Ndef(\bruno, {
	var snd = SinOsc.ar(
		freq: 43 * [rrand(2, 6), 7], // choose harmonic from 1 to 32
		mul: 0.05 // volume
	);
	snd = Splay.ar(snd);
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
)
// -- end of copied code

















// ========================
// Bruno only: send to jacktrip to feed OBS on server computer

(
SCLOrkJack.connect("SuperCollider:out_1", "cmn17.stanford.edu:send_1");
SCLOrkJack.connect("SuperCollider:out_2", "cmn17.stanford.edu:send_2");
)