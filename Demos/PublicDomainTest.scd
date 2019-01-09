// ===================
// PREPARATORY STEPS:
// ===================

// 1) SAVE THIS FILE AS SOMETHING ELSE OUTSIDE OF SCLOrk FOLDER
// suggestion: create your own folder under /Music and save this file as something like PublicDomainTestMYNAME.scd

// 2) DOWNLOAD SAMPLES FOLDER FROM GOOGLE DRIVE
// save it on the same folder you save your copy of this file

// 3) ADJUST SAMPLES FOLDER PATH BELOW
// find the path to the samples folder (on file browser, select folder in question, ctrl+C on it, then ctrl+V here on SuperCollider). It should go down below under variable ~samplesFolder


// =====================
// BRIEF EXPLANATION
// =====================

// The goal here is for you to compose one musical loop using up to 8 Pbindefs (last code block in this file).

// I'm calling each of these pre-composed loops as "presets". You will compose one or more "presets" that we can use as backbone of our Public Domain piece. Feel free to create more than one preset and submit to me.

// The best presets will be used to structure the final composition.

// Each Pbindef plays a "part", much like an orchestral or choral part. So Pbindef(\p1) is player 1, Pbindef(\p2) is player 2, etc. Eventually these Pbindefs will be playing by real individual players in SCLOrk. As you compose, you play them all together in this file to check results. But keep in mind final goal (in a future week) will be to distribute the Pbindefs you create to separate SCLOrk players.

// Change anything other parameter you want, but keep \dur always as 1/8. If you have a very specific need for a triplet, let me know and I'll help you. But a lot of great patterns can be created just with the 1/8 duration, and messing with the amp grid (the list of 0's and 1's).

// You could have all your players using the same sample, or all using different samples, and you can control which portion of the sample is used, etc. Try to keep at least one of the samples in a very recognizable state -- can the audience tell what is one of the songs playing? We want that to happen at least some of the time.

// Refer to the samples folder to see what samples are available. You just need to use the year plus the letter to refer to them inside the Pbindef (for example, '1990A', '1968A', etc). Note it must be inside single quotes.





// ================
// LOAD SAMPLES
// LOAD SYNTHDEF
// (all in a single block)
// ================


// BOOT SERVER FIRST
s.boot;

// run this:
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

// SynthDef

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

) // end of loading samples and synthdef block


// ================================
// TEST
// check if your samples loaded OK
// ================================
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
// ~timeClient = SCLOrkTimeClient.new;

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



// ===============
// COMPOSE!
// Here are 8 Pbindefs.
// Modify them as you want to create an awesome sequence
// The best sequences will be used as "presets" in the final piece
// PS. If you are done creating one polyphonic sequence and wants to move on and create another one, simply SAVE AS this file with a new name, and go ahead modifying the Pbindefs again.
// ===============


// IF for whatever reason your Pbindefs break or stop working as expected, run this:

Pbindef.all.clear;


// DESIGN up to 8 PARTS THAT GO ALONG WELL TOGETHER
// You can change any values, and simply run ctrl+enter right away (no ctrl+period necessary). Wait 4 beats and they will update.

// TIP: to work on separate Pbindefs, enclose one or more in separate code blocks as need, as you work your way up to 8 voices.


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


