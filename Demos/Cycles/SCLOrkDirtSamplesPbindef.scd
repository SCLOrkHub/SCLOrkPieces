/*

-- loads necessary scd files

-- provides some Pbindef examples

*/

// Load all 2000 samples (will reboot server automatically)
// Takes several seconds to load them all
"SCLOrkDirtSamplesLoad.scd".loadRelative;

// Browse samples with a GUI
"SCLOrkDirtSamplesBrowse.scd".loadRelative;

// Load a simple SynthDef called \pb for playback
"SCLOrkDirtSamplesSynthDef.scd".loadRelative;


// event type could check buffer numchannels and pick synthdef accordingly
// event type could take care of 'cycle' conversion business

// Some examples


(
// Custom function - takes in a list and optional cycle duration in beats.
// Returns a list of durations based on the composition of the array
~dursFrom = {|array, dur=1|
    var size = array.size;
    var subdiv = dur / size;
    var result = array.collect({ |item|
        if(item.isArray, {
            ~dursFrom.value(item, subdiv)
        }, {
            subdiv
        });
    });
    result.flat;
};

// quick trick to include option for a rest in dictionary
d.add(\r -> \rest);
)

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];
samples = [\house5!2, \house2, \cp0, \db3];
// samples = [\house5!2, \house2, Prand([\cp0, \sn1, \drum0]), \db3];
// samples = [\house5!2, \house2, \r, \cp1, \r, \cp0]; // \r is a rest
// samples = [\amencutup0, [\drum2, \drum2], \drum0, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = \bd9.dup(16);
// samples = \sn0.dup(8); // long version for \sn0!8

Pbindef(\wow,
	\instrument, \pb,
	\sampleName, Pseq(samples.flat, inf).trace,
	\buf, Pfunc({ |e| d.at(e[\sampleName]) }),
	\dur, Pseq(~dursFrom.(samples), inf) * 1,
	\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
	\rate, Pwhite(1, 1.01) * 1,
	\hpff, Pwhite(20, 500),
	\hpfr, 0.51,
	\test, Pkey(\buf).numChannels
).play(quant: 4).quant = 4;
)





Pbindef(\wow).clear









(
Pbindef(\xtra,
	\instrument, \pb,
	\buf, Pseq([d.electro18, d.electro10, d.electro15], inf),
	\dur, Prand([Pn(0.125, 4), Pn(0.25, 4)], inf),
	\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 1,
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
	\buf, Pseq([d.arpy5], inf),
	\dur, 1/8,
	\amp, 0.025 * Pwhite(0, 1),
	\rate, Pwhite(0.3, 1.0).round(0.2)
).play(quant: 1).quant = 1;
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

(
// ~degrees = [0, 1, 5, 4];
// ~degrees = [0, 1, [5, 5], 4];
~degrees = [0, 2, 4, 8];
// ~degrees = [0, 2, 7];
// ~degrees = [0, 1, 5, 4, 1, 2, 6, 5];
~degrees = [0, 1, 5, 4, 1, \r, 6, 5];
// ~degrees = [[0, 1, 5, 4], [1, 2, 6]];
// ~degrees = [[5, 6], [4, 8, 4]];
// ~degrees = [[0, 0], [4, 5, 3, 2, 1]];
// ~degrees = [[0, \r, -2], [4, 5, 3, 2, 1]];

Pbindef(\a,
	\degree, Pseq(~degrees.flat, inf),
	\dur, Pseq(~dursFrom.(~degrees), inf),
	\amp, 0.01, //Pseq([0.2, 0.1, 0.05, 0.05], inf),
).play(quant: 4).quant_(4);
)

Pbindef(\a).stop;

















(
e = (
	wow: 5,
	bleh: 10,
	r1: nil,
	r2: nil,
	play: { (~wow + ~bleh).postln; ~r1 = ~wow * 100 }
);
)

e.play;
e.wow
e.r2

e = (someVariable: 5, printMe: { |self, string| string.postln });

e.mul2 = { |z| z.someVariable * 2 };
e.mul2;



(
~func = {|array, dur=1|
    var size = array.size;
    var subdiv = dur / size;
    var result = array.collect({ |item|
        if(item.isArray, {
            ~func.value(item, subdiv)
        }, {
            subdiv
        });
    });
    result.flat;
};
)
(
~cycle = (
	func: {|e|
		(e.myDur + 88).postln;
		e.myArray.postln;
/*    var size = array.size;
    var subdiv = dur / size;
    var result = array.collect({ |item|
        if(item.isArray, {
            ~func.value(e, item, subdiv)
        }, {
            subdiv
        });
    });
    result.flat;*/
},
	myArray: [60, 60, 60, 60],
	myDur: 1,
	subdivision: { |e| e.myDur / (e.myArray.size) },
	// durs: {|e| ~func.value(e.myArray, e.myDur) }
	// play: { .size.postln }
);
)




~cycle.func(~cycle, [5, 5]);







// specifying a pattern of instruments
i = [\bd, \hh, [\cp, \cp], [\hh, \hh, \hh] ];
~cycle.( );

// specifying a pattern of amplitudes
a = [1, 0, [1, 1], [1, 1, 0.5]];
~cycle.(a);

// specifying a pattern of midinotes
m = [60, 60, 59, [40, 43, 43], 35];
~cycle.(m);


d.db8.numChannels

(
Event.addEventType(\cycleEvent, { |server|
	~bufNumChannels = ~buf.numChannels * [0.5, 1];
	// ~dur = ~bufNumChannels, inf;
    ~type = \note; // now set type to a different one
    currentEnvironment.play;
});

Pbind(
	\type, \cycleEvent,
	\buf, d.db8,
	\degree, Pseq([0, 1, 2, 3, 4, 4, 5, 5, 5, 5, 4, 2, 3, 2, 3, 1], inf),
	// \dur, Pwhite(0.1, 1.0, inf)
).trace.play;
)
