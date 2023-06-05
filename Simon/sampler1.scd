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
~ap = Buffer.read(s, ~here ++  "skate1.wav");
~aq = Buffer.read(s, ~here ++  "skate2.wav");
~ar = Buffer.read(s, ~here ++  "skate3.wav");
~as = Buffer.read(s, ~here ++  "skate4.wav");
~at = Buffer.read(s, ~here ++  "room.wav");
~au = Buffer.read(s, ~here ++  "stepsnsit.wav");
~av = Buffer.read(s, ~here ++  "walking10.wav");
~aw = Buffer.read(s, ~here ++  "safeway6.wav");
~ax = Buffer.read(s, ~here ++  "safeway5.wav");
~ay = Buffer.read(s, ~here ++  "safeway4.wav");
~az = Buffer.read(s, ~here ++  "safeway3.wav");
~ba = Buffer.read(s, ~here ++  "yawn.wav");
~bb = Buffer.read(s, ~here ++  "walking11.wav");
~bc = Buffer.read(s, ~here ++  "walking12.wav");
~bd = Buffer.read(s, ~here ++  "walking13.wav");
~be = Buffer.read(s, ~here ++  "walking14.wav");
~bf = Buffer.read(s, ~here ++  "walking15.wav");
~bg = Buffer.read(s, ~here ++  "walking16.wav");
~bh = Buffer.read(s, ~here ++  "walking17.wav");
~bi = Buffer.read(s, ~here ++  "walking18.wav");
~bj = Buffer.read(s, ~here ++  "walking19.wav");
~bk = Buffer.read(s, ~here ++  "walking20.wav");
~bl = Buffer.read(s, ~here ++  "walking21.wav");
~bm = Buffer.read(s, ~here ++  "walking7.wav");
~bn = Buffer.read(s, ~here ++  "walking8.wav");
~bo = Buffer.read(s, ~here ++  "walking9.wav");
~bp = Buffer.read(s, ~here ++  "walking22.wav");
~bq = Buffer.read(s, ~here ++  "walking23.wav");
~br = Buffer.read(s, ~here ++  "walking24.wav");
~bs = Buffer.read(s, ~here ++  "dormsteps.wav");
~bt = Buffer.read(s, ~here ++  "acai.wav");
~bu = Buffer.read(s, ~here ++  "walking25.wav");
~bv = Buffer.read(s, ~here ++  "walking26.wav");
~bw = Buffer.read(s, ~here ++  "walking27.wav");
~bx = Buffer.read(s, ~here ++  "walking28.wav");
~by = Buffer.read(s, ~here ++  "walking29.wav");
~bz = Buffer.read(s, ~here ++  "walking30.wav");
~ca = Buffer.read(s, ~here ++  "walking31.wav");
~cb = Buffer.read(s, ~here ++  "final.wav");
)


(
Ndef(\sample1).fadeTime = 6;
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
Ndef(\sample2).fadeTime = 6;
Ndef(\sample2, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~v.numChannels,
		bufnum: ~v,
		rate: 1,
		startPos: 0,
		loop: 0
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
		numChannels: ~x.numChannels,
		bufnum: ~x,
		rate: 1,
		startPos: 0,
		loop: 0
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
		numChannels: ~ak.numChannels,
		bufnum: ~ak,
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
Ndef(\sample6).stop(10);

(
Ndef(\sample6).fadeTime = 6;
Ndef(\sample6, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~at.numChannels,
		bufnum: ~at,
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
		numChannels: ~ax.numChannels,
		bufnum: ~ax,
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
		numChannels: ~bb.numChannels,
		bufnum: ~bb,
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
		numChannels: ~bf.numChannels,
		bufnum: ~bf,
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
		numChannels: ~bj.numChannels,
		bufnum: ~bj,
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
Ndef(\sample11).fadeTime = 6;
Ndef(\sample11, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~bn.numChannels,
		bufnum: ~bn,
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
Ndef(\sample12).fadeTime = 6;
Ndef(\sample12, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~br.numChannels,
		bufnum: ~br,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample12).stop(12);

(
Ndef(\sample13).fadeTime = 6;
Ndef(\sample13, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~bv.numChannels,
		bufnum: ~bv,
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
Ndef(\sample14).fadeTime = 6;
Ndef(\sample14, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~bz.numChannels,
		bufnum: ~bz,
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
Ndef(\sample15).fadeTime = 6;
Ndef(\sample15, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~y.numChannels,
		bufnum: ~y,
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
Ndef(\sample16).fadeTime = 6;
Ndef(\sample16, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~al.numChannels,
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
Ndef(\sample16).stop(10);

(
Ndef(\sample17).fadeTime = 6;
Ndef(\sample17, {
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
Ndef(\sample17).stop(10);


(
Ndef(\sample18).fadeTime = 6;
Ndef(\sample18, {
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
Ndef(\sample18).stop(10);

(
Ndef(\sample19).fadeTime = 6;
Ndef(\sample19, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~p.numChannels,
		bufnum: ~p,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample19).stop(10);

(
Ndef(\sample20).fadeTime = 10;
Ndef(\sample20, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~cb.numChannels,
		bufnum: ~cb,
		rate: 1,
		startPos: 0,
		loop: 0
    );
	snd = HPF.ar(snd, 600);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd);
}).play;
)
Ndef(\sample20).stop(6);
