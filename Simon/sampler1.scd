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
Ndef(\sample1).fadeTime = 10;
Ndef(\sample1, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~a.numChannels,
		bufnum: ~a,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample1).stop(10);


(
Ndef(\sample3).fadeTime = 10;
Ndef(\sample3, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~c.numChannels,
		bufnum: ~c,
		rate: 1,
		startPos: 0,
		loop: 1
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample3).stop(5);


(
Ndef(\sample5).fadeTime = 10;
Ndef(\sample5, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~e.numChannels,
		bufnum: ~e,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample5).stop(10);

(
Ndef(\sample7).fadeTime = 10;
Ndef(\sample7, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~g.numChannels,
		bufnum: ~g,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample7).stop(10);

(
Ndef(\sample9).fadeTime = 10;
Ndef(\sample9, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~i.numChannels,
		bufnum: ~i,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample9).stop(10);

(
Ndef(\sample11).fadeTime = 10;
Ndef(\sample11, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~k.numChannels,
		bufnum: ~k,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample11).stop(10);

(
Ndef(\sample13).fadeTime = 10;
Ndef(\sample13, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~m.numChannels,
		bufnum: ~m,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample13).stop(10);


(
Ndef(\sample15).fadeTime = 10;
Ndef(\sample15, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~o.numChannels,
		bufnum: ~o,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample15).stop(10);
