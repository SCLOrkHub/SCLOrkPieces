~here = "/home/sclork-13/Desktop/SimonSamples/";

(
~skatea = Buffer.read(s, ~here ++ "skate1.wav");
~skateb = Buffer.read(s, ~here ++ "skate2.wav");
~skatec = Buffer.read(s, ~here ++ "skate3.wav" );
~skated = Buffer.read(s, ~here ++ "skate4.wav" );
)


(
Ndef(\skate4).fadeTime = 10;
Ndef(\skate4, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~skated.numChannels,
		bufnum: ~skated,
		rate: 1,
		startPos: 0,
		loop: 1
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd) * 3;
}).play;
)
Ndef(\skate4).stop(20);
