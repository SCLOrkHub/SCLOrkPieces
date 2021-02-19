// =============================
// Music @ Noon, February 2021
// =============================


// CLEANING UP TOCCATA FIRST

// 1) Control Period to clean up Toccata leftover synths

// 2) Close QuNeo GUI (manually, or using line below)
Window.find("SCLOrkQuNeo").close;

// 3) Red buttons: Dirt Samples, SCLOrkSynths, All The Rest
//(SCLOrkChat should be open already, if not, re-open it)

// 4) Stop jacktrip: find terminal window, CONTROL + C to stop jacktrip process, then close terminal window. [note: only Bruno keeps jacktrip running]

// 5) Clean up Toccata jack connections:
SCLOrkJack.disconnectAll;

// 6) Redo jack connections for Ndef improv:
(
SCLOrkJack.connect("SuperCollider:out_1", "system:playback_1");
SCLOrkJack.connect("SuperCollider:out_2", "system:playback_2");
)
// (bruno only: also connect sc 1-2 to cmn17 1-2 for live stream)

// 7) On K6, switch headphones monitoring to channels 1/2

// 8) NOW YOU CAN GO PUBLIC!
// (note: if you need to do any of the above again, go PRIVATE first, do what you need, then go public again)

// Scroll down for starter code.
// (or: if directed by bruno, use the last code from last time to start this one)








// ++ code copied from bruno
(
// remember to change name!!!!!!!!!!!!!
Ndef(\bruno).fadeTime = 10;
Ndef(\bruno, {
	var snd = SinOsc.ar(
		freq: 43 * [2, 5], // choose harmonic from 1 to 32
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