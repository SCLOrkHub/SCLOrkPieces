//=================
// LOAD SAMPLES
// LOAD SYNTHDEF
// (all in a single block)
// ================

s.waitForBoot({

	Buffer.freeAll;

	~mySamples = Dictionary.new(100);

	// copied from wslib to avoid installing the Quark
	~asNumberIfPossible = { arg string;
		var couldBeNumber = string.every({ |item, i|
			((item.isDecDigit) or: (item == $.))
			or: ((item == $-) && (i == 0))
		});

		if(couldBeNumber && (string != "-") )
		{string.interpret} {string}
	};


	// Dictionary will be populated with buffers
	// Dictionary keys will be first 5 characters of file name, which in this case are always something like 1978A, 1956B, etc.
	// So code below looks for FIRST NUMBER in the path string.
	// LIMITATION: no other previous part of the path should contain numbers (in other words, you can't have a path like /home/sclork/Music45/samples/... as this code would wrongly think 45 is the beginning of file name).

	(~samplesFolder++"/*.wav").resolveRelative.pathMatch.do({ arg path;
		var index = 0;
		var key, value;

		path.postln;

		// find first number in path (hopefully first character of file name, which begins with year)
		while(
			{ ~asNumberIfPossible.value(path[index].asString).isNumber.not },
			{ index = index + 1 }
		);

		key = path[index..(index+4)].asSymbol;
		value = Buffer.readChannel(s, path, channels: [0]);

		s.sync;

		~mySamples.put(key, value);

	});

	// SynthDef

	SynthDef("playBuf", {arg amp=1, rate=1, att=0.01, rel=0.1, bufnum=0, startPos=0, crv = -4;
		var snd, env;
		env = Env.perc(attackTime: att, releaseTime: rel, level: amp, curve: crv).kr(2);
		snd = PlayBuf.ar(
			numChannels: 1,
			bufnum: bufnum,
			rate: rate * BufRateScale.kr(bufnum),
			startPos: startPos * BufSamples.kr(bufnum)
		);
		Out.ar(0, snd*env)
	}).add;

	SynthDef("playBufASR", {arg amp=1, rate=1, att=0.01, rel=0.1, bufnum=0, startPos=0, gate=1;
		var snd, env;
		env = Env.asr(attackTime: att, sustainLevel: amp, releaseTime: rel).kr(doneAction: 2, gate: gate);
		snd = PlayBuf.ar(
			numChannels: 1,
			bufnum: bufnum,
			rate: rate * BufRateScale.kr(bufnum),
			startPos: startPos * BufSamples.kr(bufnum)
		);
		Out.ar(0, snd*env)
	}).add;


}); // end of waitForBoot
