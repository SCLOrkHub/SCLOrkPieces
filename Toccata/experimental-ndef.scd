// run this first (just once)
s.quit;
s.options.memSize = 57344*2;
s.options.maxNodes = 1024*2;
s.boot;

// Converting Toccata SynthDefs into Ndefs
// Examples below
// (t36 is toccata button 36, etc).



// =======================

(
Ndef(\t36, {
	var source, snd, env2;
	source = Mix.ar(SoundIn.ar([0, 1]));
	env2 = Env.new(
		levels: [0.0001, 0.05, 0.95],
		times: [2, 6],
		curve: 'exponential'
	).kr;
	snd = PitchShift.ar(
		in: source,
		windowSize: 2.0,
		pitchRatio: 1.0,
		pitchDispersion: 0.3 + env2,
		timeDispersion: 1.7
	);
	snd = Mix.ar(Limiter.ar(snd));
}).play;
)

Ndef(\t36).clear(2);



// ===========================
(
Ndef(\t37, {
	var source, buffer, snd, env2;
	source = Mix.ar(SoundIn.ar([0, 1]));
	// allocate a 1-sec mono buffer
	buffer = LocalBuf.new(SampleRate.ir * 1.0, 1);
	// record mic input into that buffer
	RecordBuf.ar(
		inputArray: source,
		bufnum: buffer,
		run: Line.kr(1, 0, 5) // when this reaches zero, recording stops and loop begins. In this case, it takes 5 seconds
	);
	env2 = Env.new(
		levels: [0.0001, 0.3, 1.7],
		times: [4, 16],
		curve: 'exponential'
	).kr;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		loop: 1
	);
	snd = PitchShift.ar(
		in: snd,
		windowSize: 1.0,
		pitchRatio: 1.4,
		pitchDispersion: 0.3 + env2,
		timeDispersion: 0.5
	);
	snd = Mix.ar(Limiter.ar(snd));
}).play;
)

Ndef(\t37).clear(3);





// ====================================

~buffer = Buffer.alloc(s, s.sampleRate * 1.0, 1);
(
Ndef(\t40, {
	var buffer, source, snd1, snd2, playbuf,
	dtime1, dtime2, dtime3,
	mix, decay,
	toscil, toscil2, toscil3;

	buffer = ~buffer;
	// get sound from mic(s)
	source = Mix.ar(SoundIn.ar([0, 1]));

	// record mic input into that buffer
	RecordBuf.ar(
		inputArray: source,
		bufnum: buffer,
		run: Line.kr(1, 0, 5)
	);

	dtime1 = XLine.kr(0.58, 0.007, 6);
	dtime2 = XLine.kr(0.43, 0.005, 8);
	dtime3 = XLine.kr(1.00, 0.040, 5);

	toscil = Dust.kr(16, mul: 0.006);
	toscil2 = Dust.kr(9, mul: 0.006);
	toscil3 = Dust.kr(5, mul: 0.006);

	playbuf = PlayBuf.ar(1, buffer, loop: 1);

	snd1 = CombC.ar(
		in: playbuf,
		maxdelaytime: 1.0,
		delaytime: [dtime1 + toscil, dtime2 + toscil2],
		decaytime: 0.5,
		add: playbuf * 0.4
	);
	snd1 = PitchShift.ar(
		in: snd1,
		windowSize: 3.0,
		pitchRatio: 1.0,
		pitchDispersion: 0.3,
		timeDispersion: 1.0
	);
	snd2 = CombC.ar(
		in: playbuf,
		maxdelaytime: 1.0,
		delaytime: toscil3 + dtime3,
		decaytime: 0.5
	);
	snd2 = PitchShift.ar(
		in: snd2,
		windowSize: 3.0,
		pitchRatio: 1.0,
		pitchDispersion: 0.7,
		timeDispersion: 0.4
	);
	decay = XLine.kr(0.4, 0.002, 50);
	mix = Mix.ar([
		playbuf * decay,
		snd1 * 0.8,
		snd2 * 0.7
	]);
	// mix = playbuf;
	mix = BPF.ar(
		in: mix,
		freq: LFNoise0.kr(1/2).range(200, 2000),
		rq: LFNoise2.kr(1).range(0.1, 1),
		add: mix * SinOsc.ar(1/6).range(0, 1)
	);
	mix = Mix.ar(Limiter.ar(in: mix, level: 0.8, dur: 0.03));
}).play;
)

Ndef(\t40).clear(3);




// Questions for future: investigate whether it's best to use LocalBuf or external Buffer declaration (t37 uses LocalBuf, t40 uses external buffer). Is either t37 or t40 buggy when you re-run it multiple times?

// NOTE: the ones that have a built-in loop (like t37 and t40), PlayBuf is set to loop over the 1-second buffer. Recording starts as soon as you run the Ndef, and stops 5 seconds later (Line.kr controls that). You can increase time it takes to stop recording into buffer by increasing duration of Line.kr
