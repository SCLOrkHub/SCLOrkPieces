
(
// remember to change name!
Ndef(\playbuf).fadeTime = 1;
Ndef(\playbuf, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: d.alphabet9,
		rate: 1,
		// trigger: Impulse.kr(5),
		loop: 0

	);
	//snd = snd * Line.kr(1, 0.25, 20);
	snd = FreeVerb.ar(snd, 0.4, 0.9, 0.2);
	snd = Pan2.ar(Mix(snd), 0.0);
	snd = Limiter.ar(snd) * 0.5;
}).play;
)

Ndef(\playbuf).stop(10);

