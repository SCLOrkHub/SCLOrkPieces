// Start JackTrip
// Load Toccata (Load New Piece > Toccata)
// Headphones 3/4
// Open SCLOrkChat
// PRIVATE mode

// Open VLC, open museum video, use Control H for minimal interface, make it Always on Top, resize to your liking


// It's OK to minimize Red buttons if you like

// NOTE: we will be using JackTrip at a very low latency -- to be as close to real time as possible -- this will generate some glitching on our monitoring stream, but the audience will be getting a clean, delayed stream. (typical compromise in these cases)



















// bruno -- add to quneo this ndef playing the messiaen, allow for some effects too


SCLOrkSamples.loadFile("/home/sclork/Desktop/messiaen_yoyoma_10min.wav", \yoyo);

d.yoyo

(
// remember to change name!
Ndef(\yo).fadeTime = 1;
Ndef(\yo, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: d.yoyo,
		rate: 1,
		loop: 1
	);
	// snd = Decimator.ar(snd, XLine.kr(44100, 8888, 20), XLine.kr(16, 4, 20));
	// snd = FreeVerb.ar(snd, 0.4, 0.9, 0.2);
	// snd = Pan2.ar(Mix(snd), 0.0);
	// snd = Limiter.ar(snd) * 0.5;
});
)

(
// remember to change name!
Ndef(\yoFx).fadeTime = 10;
Ndef(\yoFx, {
	var snd;
	snd = Ndef.ar(\yo);
	snd = Decimator.ar(snd, MouseX.kr(1900, 20000), Line.kr(16, 3, 10));
	snd = FreeVerb.ar(snd, 0.4, 0.9, 0.2);
	snd = Pan2.ar(Mix(snd), SinOsc.ar(1/10).range(-0.5, 0.5));
	snd = Limiter.ar(snd) * 0.001;
}).play;
)

Ndef(\yoFx).clear(10);


