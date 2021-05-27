// =============================
// GMO (Ndef improvisation)
// =============================

// FIRST PIECE - JUNE 2nd 2021 CONCERT

// 1) CONTROL + PERIOD to clean up any previous leftover synths

// 2) Make sure there is no Toccata GUI open (leftover from a previous run)

// 3) Push RED buttons:
// Dirt Samples
// SCLOrkSynths
// SCLOrkChat
// JackTrip (start, then choose patch #2)
// Reset

// 4) NOW YOU CAN GO PUBLIC!

// Scroll down for starter code.
// (or: if directed by bruno, use another one)

// NOTE 1: Headphones 3/4!
// NOTE 2: Keep your K6 big knob DOWN (at zero position). If you are called to speak about your group piece in the middle of the concert, bring K6 big knob UP to a reasonable level (mic gains as well), speak, then bring K6 knob DOWN before playing the Ndef piece.

// There is no more AudioChat button. In the new JackTrip Patch 2, the only thing between your microphone and the live stream is your K6 BIG KNOB. Use it wisely.






// STARTER CODE
(
// remember to change name!!!!!!!!!!!!!
Ndef(\bruno).fadeTime = 3;
Ndef(\bruno, {
	var snd = SinOsc.ar(
		freq: 43 * 6, // choose harmonic from 1 to 32
		mul: 0.04 // volume
	);
	snd = Pan2.ar(in: Mix(snd), pos: 0.0);
	snd = Limiter.ar(snd) * 1; // another master volume control
}).play;
)

Ndef(\bruno).stop(10);








