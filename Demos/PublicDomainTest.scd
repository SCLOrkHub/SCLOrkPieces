// SAVE THIS FILE AS SOMETHING ELSE OUTSIDE OF SCLOrk FOLDER
// like PublicDomainTestBruno.scd




// BOOT SERVER FIRST
s.boot;

// LOAD SYNTHDEF
(
SynthDef("playBuf", {arg amp=1, rate=1, att=0.01, rel=0.1, bufnum=0, startPos=0;
	var snd, env;
	env = Env.perc(attackTime: att, releaseTime: rel, level: amp).kr(2);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: rate * BufRateScale.kr(bufnum),
		startPos: startPos * BufSamples.kr(bufnum)
	);
	Out.ar(0, snd*env)
}).add;
)

// ================
// LOADING SAMPLES
// ================

(
~samplesFolder = "/home/sclork/Music/CopyrightSamples";

~mySamples = Dictionary.new(100);

// copied from wslib to avoid installing the Quark
~asNumberIfPossible = { arg string;
	var couldBeNumber = string.every({ |item, i|
			((item.isDecDigit) or: (item == $.))
			or: ((item == $-) && (i == 0))
			});

	if(string.couldBeNumber && (string != "-") )
		{string.interpret} {string}
};

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

	~mySamples.put(key, value);

});
)

// TEST
a = ~mySamples.at('1983C').play;
b = ~mySamples.at('1956A').play;
c = ~mySamples.at('1982A').play;
a.free;
b.free;
c.free;

// =================
// SCLOrkTimeClient
// =================
// Create a new time client
// This needs to be done ONLY ONCE after you open SuperCollider
// It will survive Ctrl+period
~timeClient = SCLOrkTimeClient.new;



// ===============
// SCLOrkClock!
// ===============
// Start the clock
// Print the beats
// If you hit Ctrl+period, you have to run this again
(
~clock = SCLOrkClock.new(~timeClient);
~clock.play({ "server beats: %".format(~clock.beats).postln; ^1 });
)



// if you need a local clock
// ~clock = TempoClock(60/60);


// DESIGN 8 PARTS THAT GO ALONG WELL TOGETHER
// (eventually these will be one Pbindef per player)

(
Pbindef(\p1,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1982A'),
	\dur, 1/8,
	\rate, 1/2, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.6,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 1, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 0, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p2,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1982A'),
	\dur, 1/8,
	\rate, 1.5, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 1, 0, // beat 2
		0, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p3,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1939A'),
	\dur, 1/8,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 1, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p4,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1966A'),
	\dur, 1/8,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.4, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		1, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 0, 0, 0,   0, 0, 0, 1, // beat 2
		1, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p5,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1982A'),
	\dur, 1/8,
	\rate, 4, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		0, 1, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 1, // beat 2
		0, 0, 1, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p6,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1982A'),
	\dur, 1/8,
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 1, 0, 0,   0, 0, 0, 0, // beat 2
		1, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p7,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1984A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1.1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, 0.1,
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		1, 1, 0, 0,   0, 0, 0, 1, // beat 2
		1, 1, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 0, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;

Pbindef(\p8,
	\instrument, "playBuf",
	\bufnum, ~mySamples.at('1976A'),
	\dur, 1/8, //Prand([1/4, Rest(1/4)], inf),
	\rate, 1, //Pseq([1, 1.5, 2, 2.5], inf),
	\startPos, 0.8, //Pseq([0.2, 0.199], inf),
	\att, 0.1,
	\rel, Pwhite(0.01, 0.5),
	\amp, Pseq([
		0, 0, 0, 0,   0, 0, 0, 0, // beat 1
		0, 0, 0, 0,   0, 0, 0, 0, // beat 2
		0, 0, 0, 0,   0, 0, 0, 0, // beat 3
		0, 0, 0, 0,   1, 1, 1, 0, // beat 4
	], inf),
).play(~clock, quant: 4).quant = 4;
)


