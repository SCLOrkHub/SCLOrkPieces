(
Ndef(\sample1).fadeTime = 6;
Ndef(\sample1, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~u.numChannels,
		bufnum: ~u,
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
Ndef(\sample2).stop(5);

(
Ndef(\sample3).fadeTime = 6;
Ndef(\sample3, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~ac.numChannels,
		bufnum: ~ac,
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
		numChannels: ~an.numChannels,
		bufnum: ~an,
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
		numChannels: ~s.numChannels,
		bufnum: ~s,
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
		numChannels: ~av.numChannels,
		bufnum: ~av,
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
		numChannels: ~az.numChannels,
		bufnum: ~az,
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
		numChannels: ~bd.numChannels,
		bufnum: ~bd,
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
		numChannels: ~bh.numChannels,
		bufnum: ~bh,
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
		numChannels: ~bl.numChannels,
		bufnum: ~bl,
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
		numChannels: ~bp.numChannels,
		bufnum: ~bp,
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
		numChannels: ~bt.numChannels,
		bufnum: ~bt,
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
		numChannels: ~bx.numChannels,
		bufnum: ~bx,
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
		numChannels: ~ab.numChannels,
		bufnum: ~ab,
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
		numChannels: ~af.numChannels,
		bufnum: ~af,
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

(
Ndef(\sample16).fadeTime = 6;
Ndef(\sample16, {
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
Ndef(\sample16).stop(10);


(
Ndef(\sample17).fadeTime = 6;
Ndef(\sample17, {
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
Ndef(\sample17).stop(10);

(
Ndef(\sample18).fadeTime = 6;
Ndef(\sample18, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: ~ai.numChannels,
		bufnum: ~ai,
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

