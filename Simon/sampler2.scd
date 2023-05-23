~here = Quarks.folder ++ "/SCLOrkPieces/Simon/";


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
~j = Buffer.read(s, ~here ++ "SCLORK-3.wav");
~k = Buffer.read(s, ~here ++ "Benson 1.wav");
~l = Buffer.read(s, ~here ++ "Benson 2.wav");
~m = Buffer.read(s, ~here ++ "Benson 3.wav");
~n = Buffer.read(s, ~here ++ "lawnmower1.wav");
~o = Buffer.read(s, ~here ++ "birds.wav");
~p = Buffer.read(s, ~here ++ "Sing.wav");
~q = Buffer.read(s, ~here ++  "walking2.wav");
~r = Buffer.read(s, ~here ++  "walking3.wav");
~s = Buffer.read(s, ~here ++  "walking4.wav");
~t = Buffer.read(s, ~here ++  "walking6.wav");
~u = Buffer.read(s, ~here ++  "walkingcars.wav");
~v = Buffer.read(s, ~here ++  "walkingcars2.wav");
~w = Buffer.read(s, ~here ++  "walkingconvo.wav");
~x = Buffer.read(s, ~here ++  "walkingconvo3.wav");
~y = Buffer.read(s, ~here ++  "walkingskate.wav");
~z = Buffer.read(s, ~here ++  "walkingskate2.wav");
~aa = Buffer.read(s, ~here ++  "washing.wav");
~ab = Buffer.read(s, ~here ++  "trifflin1.wav");
~ac = Buffer.read(s, ~here ++  "stairswalk.wav");
~ad = Buffer.read(s, ~here ++  "quiet.wav");
~ae = Buffer.read(s, ~here ++  "pressed1.wav");
~af = Buffer.read(s, ~here ++  "crosswalk2.wav");
~ag = Buffer.read(s, ~here ++  "crosswalk.wav");
~ah = Buffer.read(s, ~here ++  "convo5.wav");
~ai = Buffer.read(s, ~here ++  "convo4.wav");
~aj = Buffer.read(s, ~here ++  "Cellar2.wav");
~ak = Buffer.read(s, ~here ++  "Cellar1.wav");
~al = Buffer.read(s, ~here ++  "Benson5.wav");
~am = Buffer.read(s, ~here ++  "benson4.wav");
~an = Buffer.read(s, ~here ++  "applestairs.wav");
~ao = Buffer.read(s, ~here ++  "ambient1.wav");
)

(
Ndef(\sample1).fadeTime = 6;
Ndef(\sample1, {
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
Ndef(\sample1).stop(10);


(
Ndef(\sample2).fadeTime = 6;
Ndef(\sample2, {
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
Ndef(\sample2).stop(5);

(
Ndef(\sample3).fadeTime = 6;
Ndef(\sample3, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~ah.numChannels,
		bufnum: ~ah,
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
Ndef(\sample4).fadeTime = 6;
Ndef(\sample4, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~aj.numChannels,
		bufnum: ~aj,
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
Ndef(\sample5).fadeTime = 6;
Ndef(\sample5, {
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
Ndef(\sample5).stop(10);

(
Ndef(\sample6).fadeTime = 6;
Ndef(\sample6, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~ad.numChannels,
		bufnum: ~ad,
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
Ndef(\sample7).fadeTime = 6;
Ndef(\sample7, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~ag.numChannels,
		bufnum: ~ag,
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
Ndef(\sample8).fadeTime = 6;
Ndef(\sample8, {
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
Ndef(\sample8).stop(10);


(
Ndef(\sample9).fadeTime = 6;
Ndef(\sample9, {
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
Ndef(\sample9).stop(10);

(
Ndef(\sample10).fadeTime = 6;
Ndef(\sample10, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~q.numChannels,
		bufnum: ~q,
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


