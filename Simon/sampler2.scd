~here = "".resolveRelative;


// load your samples here
(
~a = Buffer.read(s, ~here ++ "Door-cars.wav");
~b = Buffer.read(s, ~here ++ "SCLORK-2.wav");
~c = Buffer.read(s, ~here ++ "Walking.wav" );
~d = Buffer.read(s, ~here ++ "Tennis.wav" );
~e = Buffer.read(s, ~here ++ "birds.wav");
~f = Buffer.read(s, ~here ++ "Santa Clara University 43.wav");
~g = Buffer.read(s, ~here ++ "Santa Clara University 42.wav");
~h = Buffer.read(s, ~here ++ "lawnmower1.wav");
~i = Buffer.read(s, ~here ++ "Convo.wav");
~j= Buffer.read(s, ~here ++ "SCLORK-3.wav");
~k = Buffer.read(s, ~here ++ "Benson 1.wav");
~l = Buffer.read(s, ~here ++ "Benson 2.wav");
~m= Buffer.read(s, ~here ++ "Benson 3.wav");
~n = Buffer.read(s, ~here ++ "lawnmower1.wav");
~o = Buffer.read(s, ~here ++ "birds.wav");
~p = Buffer.read(s, ~here ++ "Sing.wav");
)


// test them
.play;
.play;


(
Ndef(\sample2).fadeTime = 10;
Ndef(\sample2, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~b.numChannels,
		bufnum: ~b,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample2).stop(10);


(
Ndef(\sample4).fadeTime = 10;
Ndef(\sample4, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~d.numChannels,
		bufnum: ~d,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample4).stop(10);

(
Ndef(\sample6).fadeTime = 10;
Ndef(\sample6, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~f.numChannels,
		bufnum: ~f,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample6).stop(10);


(
Ndef(\sample8).fadeTime = 10;
Ndef(\sample8, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~h.numChannels,
		bufnum: ~h,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample8).stop;


(
Ndef(\sample10).fadeTime = 10;
Ndef(\sample10, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~j.numChannels,
		bufnum: ~j,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample10).stop(10);

(
Ndef(\sample12).fadeTime = 10;
Ndef(\sample12, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~l.numChannels,
		bufnum: ~l,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample12).stop(10);


(
Ndef(\sample14).fadeTime = 10;
Ndef(\sample14, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~n.numChannels,
		bufnum: ~n,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample14).stop(10);

(
Ndef(\sample16).fadeTime = 10;
Ndef(\sample16, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~b.numChannels,
		bufnum: ~b,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample16).stop(10);