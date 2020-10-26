/*

-- loads necessary scd files

-- provides some Pbindef examples

*/

// Load all 2000 samples (will reboot server automatically)
// Takes several seconds to load them all, watch Post window
"SCLOrkDirtSamplesLoad.scd".loadRelative;

// Load a simple SynthDef called \pb for playback
"SCLOrkDirtSamplesSynthDef.scd".loadRelative;

// Load couple custom functions to allow "cycles" live coding style
"SCLOrkDirtSamplesFunctions.scd".loadRelative;

// Browse samples with a GUI (useful to familiarize yourself with what's available)
// the sample name in the GUI is what you will use in the live coding as a Symbol
// for example, sample named ab8 will be used as \ab8 in your code
"SCLOrkDirtSamplesBrowse.scd".loadRelative;



// ====================
// Some examples
// ====================


// The idea is to primarily play with the variable 'samples'
// The array is a sequence of samples to be played
// The number of elements in the array is interpreted as the number of equal subdivisions of a cycle (which could be one beat, one measure, or whatever cycle size you choose)
// Sub-arrays are interpreted the same way recursively.
// For for example [\sn1, \sn1, \sn1, \sn1] means four hits of a snare within a cycle, and [\sn1, \sn1, \sn1, [\sn1, \sn1]] means the fourth subdivision will be further subdivided into two equal parts etc.

// to change cycle duration, use the \stretch parameter in the Pbind

// other parameters can be altered as usual (amp and rate in particular)

// tip: comment in and out the 'samples' line you want to try. If more than one is uncommented, the later one will prevail

// feel free to copy paste more samples lines to customize / live code

(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\house5!2, \house2, \cp0, \db3];
// samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];
// samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\bass10, \gab7, \east2!3, \dork22]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \east2!3, \ifdrums0!3]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \juno3!2, \ifdrums0!3]; // \r is a rest
// samples = [\glitch20, \e7!5, \juno3, \latibro6];
samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];
// samples = [\amencutup0, [\drum2, \drum2], \drum0, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = \bd9.dup(16);
// samples = \sn0.dup(8); // long version for \sn0!8

Pbindef(\test,
	\type, \dirt,
	\sampleName, Pseq(samples.flat, inf),
	\dur, Pseq(~dursFrom.(samples), inf),
	\stretch, 1,
	\amp, 0.09, //Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
	\rate, Pwhite(1, 1.001) * 1,
	\out, 55 // if you put 55 here and run the Ndef below, whole thing goes through reverb
).play(quant: 4).quant = 4;
)


// Optional: if you send the above Pbindef to \out, 55 (ie route it to bus 55 instsead of directly out to speakers), the Pbind will go through the reverb below
(
Ndef(\fx, {
	var input = In.ar([55, 56]);
	var snd;
	snd = input;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.4,
		room: 0.7,
		damp: 0.7,
		mul: 1
	);
}).play;
)





// using a tempoclock

t = TempoClock.new(150/60).permanent_(true);

// 150 BPM
// 2.5 beats per second
// 10 ticks per second
// 2 seconds = 20 ticks = 5 beats
// 5/4 time signature @ 150 BPM

(
var samples;
// samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];
samples = [\blip1, \blip0, \a808oh3, \blip1];
// samples = [\house5!2, \house2, Prand([\bass112, \sn1, \sn2]), \db3];
// samples = [\bass10, \e7!5, \east2!3, \dork22]; // \r is a rest
// samples = [\bass10, \gab7, \east2!3, \dork22]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \east2!3, \ifdrums0!3]; // \r is a rest
// samples = [\glitch23!3, \e7!5, \juno3!2, \ifdrums0!3]; // \r is a rest
// samples = [\glitch20, \e7!5, \juno3, \latibro6];
samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];
// samples = [\a808oh0, \a808oh0, \a808oh0, \a808oh0];
// samples = [\amencutup0, [\drum2, \drum2], \drum0, \drum1, \hh3, \techno1, \amencutup13, \techno1];
// samples = \bd9.dup(16);
// samples = \sn0.dup(8); // long version for \sn0!8

Pbindef(\usingTempoClock,
	\type, \dirt,
	\sampleName, Pseq(samples.flat, inf),
	\dur, Pseq(~dursFrom.(samples), inf),
	\stretch, 1,
	\amp, Pseq([0.5, 0.45, 0.4, 0.3], inf) * 0.9 * Pwhite(0.90, 1),
	\rate, Pstutter(4, Pseq([1, 1.1, 1.02, 0.998, 1.05], inf)),
	\out, 0
).play(t, quant: 4).quant = 4;
)






(
var samples;
samples = [\trump0, \r, \trump1, \r];
samples = [\trump0, \r, \trump1!2, \trump3];
samples = [\trump0, \trump3!2, \trump1!2, \trump3];
samples = [\trump0, \trump3!2, \trump1!2, \trump3!4];
// samples = [\house6!2, \house3!rrand(1, 3), \house2!2, \cp0];

Pbindef(\tpt,
	\type, \dirt,
	\sampleName, Pseq(samples.flat, inf).trace,
	\dur, Pseq(~dursFrom.(samples), inf),
	\stretch, 1,
	\amp, 0.15, //Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
	\rate, Pwhite(0.25, 2.0).round(0.25) * 1.12,
	\pan, Pwhite(-1, 1)
).play(quant: 4).quant = 4;
)

t = PdefAllGui(8);



Pbindef(\tpt).stop;



















// A non-cycle way of playing (typical Pbind stuff)
(
Pbindef(\xtra,
	\instrument, \pb2,
	\buf, Pseq([d.electro18, d.electro10, d.electro15], inf),
	\dur, Prand([Pn(0.125, 4), Pn(0.25, 4)], inf),
	\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 1,
	\rate, Pseq([Pseries(1/2, 0.1, 16), Pwhite(1/2, 2.01, 16)], inf),
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



/*

Example from BEFORE defining new Event type \dirt

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
	\sampleName, Pseq(samples.flat, inf).trace,
	\instrument, Pfunc({ |e|
		if(d.at(e[\sampleName]).numChannels == 1, { \pb1 }, { \pb2 })
	}),
	\buf, Pfunc({ |e| d.at(e[\sampleName]) }),
	\dur, Pseq(~dursFrom.(samples), inf),
	\stretch, 1,
	\amp, 0.5, //Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.15,
	\rate, Pwhite(1, 1.001) * 1,
).play(quant: 4).quant = 4;
)

*/







