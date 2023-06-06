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
