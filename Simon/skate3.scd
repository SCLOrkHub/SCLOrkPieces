~here = "/home/sclork-13/Desktop/SimonSamples/";

(
~skatea = Buffer.read(s, ~here ++ "skate1.wav");
~skateb = Buffer.read(s, ~here ++ "skate2.wav");
~skatec = Buffer.read(s, ~here ++ "skate3.wav" );
~skated = Buffer.read(s, ~here ++ "skate4.wav" );
)


(
Ndef(\skate3).fadeTime = 10;
Ndef(\skate3, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~skatec.numChannels,
		bufnum: ~skatec,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd) * 2;
}).play;
)
Ndef(\skate3).stop(20);

(
Ndef(\skate1).fadeTime = 10;
Ndef(\skate1, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~skatea.numChannels,
		bufnum: ~skatea,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd) * 3;
}).play;
)
Ndef(\skate1).stop(20);
