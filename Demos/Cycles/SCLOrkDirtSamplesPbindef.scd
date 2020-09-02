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
var l;
// l = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// l = [\house6, \house3, \house3, \cp0];
l = [\amencutup0, \drum2, \drum0, \drum1, \hh3, \techno1, \amencutup13, \techno1];
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
