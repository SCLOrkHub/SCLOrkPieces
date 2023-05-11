/*

#1: All the Sines

#2: Run Clusters

#3: Bring in Low (sine and cluster) and letter names a-d (sine)

#4: Play High and white if you have it

#5: Sine (fade out all other ndefs except sine). Others fade out others and play the letter you have.

#6: fade out

*/

~here = "".resolveRelative;


// load your samples here
(
~a = Buffer.read(s, ~here ++ "Downloads/Door-cars.wav");
~b = Buffer.read(s, ~here ++ "Downloads/SCLORK-2.wav");
~c = Buffer.read(s, ~here ++ "Downloads/Walking.wav" );
~d = Buffer.read(s, ~here ++ "Downloads/Tennis.wav" );
~e = Buffer.read(s, ~here ++ "Desktop/birds.wav");
~f = Buffer.read(s, ~here ++ "Downloads/Santa Clara University 43.wav");
~g = Buffer.read(s, ~here ++ "Downloads/Santa Clara University 42.wav");
~h = Buffer.read(s, ~here ++ "Desktop/lawnmower1.wav");
~i = Buffer.read(s, ~here ++ "Downloads/Convo.wav");
~j= Buffer.read(s, ~here ++ "Downloads/SCLORK-3.wav");
~k = Buffer.read(s, ~here ++ "Downloads/Benson 1.wav");
~l = Buffer.read(s, ~here ++ "Downloads/Benson 2.wav");
~m= Buffer.read(s, ~here ++ "Downloads/Benson 3.wav");
~n = Buffer.read(s, ~here ++ "Desktop/lawnmower1.wav");
~o = Buffer.read(s, ~here ++ "Desktop/birds.wav");
~p = Buffer.read(s, ~here ++ "Downloads/Sing.wav");
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
Ndef(\sample1).clear;

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
