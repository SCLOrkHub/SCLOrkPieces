/*
what this file does so far:

-- loads ca. 2000 samples from dirt-samples
-- saves them into a dictionary, accessible by key, eg.
d.arpy1
or
d[\arpy1]

-- creates a GUI to browse all samples by name

-- creates simple SynthDef with possible effects to playback samples

-- some Pbindef examples

Consider next:
extending default event with a \cycle thing. When used, it defines dur indirectly.

Pbindef(\wow,
    \cycle, [\bd0, \bd0, \arpy1, \hh4],
    ...etc
).play

cycle gets an array. the size of array determines subdivision of beat.
so size = 4, \dur, 1/4

an array like
\cycle, [\bd0, [\bd0, \bd0, \bd0], \arpy1, [\hh4, \hh4]]
would provide durations as
[1/4, Pn(1/3, 3) * 1/4, 1/4, Pn(1/2, 2) * 1/4]


*/


(
~count = 0;
s.quit;
s.options.numBuffers = 3000;
s.options.memSize = 8192 * 100; // 100 times the default
s.waitForBoot({

	p = PathName.new(Quarks.folder ++ "/Dirt-Samples");

	d = IdentityDictionary.new(n: 2500, know: true); // know: true makes the dictionary interpret method calls as look ups.

	d.put(\rest, \rest);

	Routine.run({

		p.folders.do({ |thisFolder|

			thisFolder.entries.do({ |thisFile, count|
				var key, buffer, extension, allowedExtensions;
				extension = thisFile.extension;
				allowedExtensions = ["wav", "WAV", "aif", "AIF", "aiff", "AIFF", "aifc", "AIFC"];
				if(allowedExtensions.includesEqual(extension), {
					key = (thisFolder.folderName ++ count).asString;
					key = if(key[0].asString.asInteger==0, { key }, {"a"++key});
					key = key.asSymbol;
					// ~count = ~count + 1;
					buffer = Buffer.read(
						server: s,
						path: thisFile.fullPath
					);
					// s.sync;
					0.015.wait;
					[buffer.bufnum, key].postln;
					d.put(key, buffer);
				}, {
					[extension, "not a wav or aif file"].postln;
				});
			});
		});
	});
}); // end of waitForBoot
)



(
Window.closeAll;

t = d.keys.asArray.sort; //copyRange(0, 250);
w = Window.new("dirt-samples", Rect(10, 10, 1265, 700), resizable: false, scroll: true);
w.view.decorator = FlowLayout(w.view.bounds, 5@5, 5@5);
t.do({ |key| Button(w, 100@25)
	.states_([
		[key, Color.black, Color.white],
		[key, Color.white, Color.black]
	])
	// .mouseDownAction_({ |b| b.valueAction = 1 })
	.action_({ arg button;
		if(button.value==1,
			{
				var buffer, channels;
				buffer= d.at(key);
				channels = buffer.numChannels;
				[buffer, channels, key].postln;
				if((buffer.notNil) && (channels.notNil), {
					r = Routine.run(
						func: {
							{ Limiter.ar(
								in: PlayBuf.ar(
									numChannels:  channels,
									bufnum: buffer,
									rate: BufRateScale.kr(buffer),
									doneAction: 2
								),
								level: 0.1
							)}.play;
							buffer.duration.wait;
							button.value = 0;
						},
						clock: AppClock
					);
					}, { [key, "nil stuff"].postln });
			},{
				s.freeAll
		});
	});
});
w.front;
)






(
SynthDef(\pb, { arg amp = 0.2, rate = 1, buf, mix=0.0, room=0.5, damp=0.5, hpff = 20, hpfr=0.5, pan=0;
	var snd;
	snd = PlayBuf.ar(
		numChannels: 2,
		bufnum: buf,
		rate: BufRateScale.kr(buf) * rate,
		doneAction: 2
	);
/*	snd = FreeVerb.ar(
		in: snd,
		mix: mix,
		room: room,
		damp: damp
	);
	DetectSilence.ar(snd, doneAction: 2);*/
	snd = RHPF.ar(
		in: snd,
		freq: hpff.abs.clip(20, SampleRate.ir/2),
		rq: hpfr.linexp(0, 1, 0.001, 1)
	);
	snd = Pan2.ar(Mix(snd), pan);
	Out.ar(0, snd*amp);
}).add;

)


Synth(\pb, [\buf, d.hh3])
Synth(\pb, [\buf, d.hit0, \amp, 0.1])

d.hit0 // 1 channel
d.hh3 // 2 channels


(
var l;
l = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
l = [\house6, \house3, \house3, \cp0];
// l = [\amencutup0, \drum2, \drum0, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// l = \bd9.dup(16);
// l = d.sn0.dup(8);

Pbindef(\wow,
	\instrument, \pb,
	\buf, Pseq(l.collect{|s| d.at(s)}, inf),
	\dur, 1/l.size,
	\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
	\rate, Pwhite(1, 1.01),
	\hpff, Pwhite(20, 1500),
	\hpfr, 0.971
).play(quant: 4).quant = 4;
)

d[\yeah10].play

(
Pbindef(\xtra,
	\instrument, \pb,
	\buf, Pseq([d.electro18, d.electro10, d.electro15], inf),
	\dur, Prand([Pn(0.125, 4), Pn(0.25, 4)], inf),
	\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf),
	\rate, Pseq([Pseries(1/2, 0.1, 16), Pwhite(1/2, 2.01, 16)], inf),
	\mix, Prand([0, 0, 0, 0, 0.6], inf)
).play(quant: 1);
Pbindef(\xtra).quant = 1;
)

Pbindef(\xtra).clear;
Pbindef(\wow).clear;
Pbindef(\arpy).clear;
Pbindef(\co1).clear;
(
Pbindef(\arpy,
	\instrument, \pb,
	\buf, Pseq([d.arpy0], inf),
	\dur, 4,
	\amp, 0.5,
	\rate, 0.125,
).play(quant: 1);
Pbindef(\xtra).quant = 1;
)

(
Pbindef(\co1,
	\instrument, \pb,
	\buf, Pseq([d.moog1], inf),
	\dur, 6,
	\amp, 0.5,
	\rate, Pseq([0, 7, 10, 12].midiratio, inf),
).play(quant: 1);
Pbindef(\xtra).quant = 1;
)
