//==============================
// "CYCLES" NOTATION - EXAMPLES
// =============================

// An more in depth explanation is at the bottom of this file.


// Example 1
// Using "cycles" notation for melody
// (default synth)

(
var degrees;
degrees = [
    0,          // beat 1
	1,          // beat 2
	2,          // beat 3
	[3, 5],     // beat 4
];

Ndef(\myRiff).quant = 4;
Ndef(\myRiff).fadeTime = 0;

Ndef(\myRiff,
	Pbind(
		\scale, Scale.major,
		\degree, Pseq(degrees.flat, inf),
		\dur, Pseq(~dursFrom.(degrees), inf),
		\stretch, 4, // 4 beats
		\amp, 0.2,
	)
).play;
)

Ndef(\myRiff).stop;


// Example 2
// Using "cycles" notation for sample playback
// (nice to use with percussion)
// Load Dirt Samples first (red button)

(
var samples;
samples = [ \bd0, \cp1, \house1, \house3 ];

Ndef(\drums).quant = 4;
Ndef(\drums,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, 1,
		\rate, 1
	)
).play;
)

Ndef(\drums).stop;




// Example 3
// Using "cycles" notation for a bass line
// (using SCLOrkSynths - load red button first)


(
var degrees;
degrees = [
	[0, 0, 1, 2],          // do, do, re, mi
	[\r, 1, -2, -1],       // rest, re, la, ti
	[0, -3, -2, \r],       // do, sol, la, rest
	[0, -5, -2, 2]         // do, mi, la, mi
];
Ndef(\myBass,
	Pbind(
		// instrument comes from SCLOrkSynths
		\instrument, "acidOto3091",
		\scale, Scale.major,
		\degree, Pseq(degrees.flat, inf),
		\dur, Pseq(~dursFrom.(degrees), inf),
		\stretch, 4, // 4 beats
		\ctranspose, -24,
		\amp, Pwhite(0.2, 0.5),
		\att, 0.001,
		\rel, 0.1,
		\legato, 0.5,
		\filterRange, Pwhite(3, 4)
	)
).play.quant_(4).fadeTime_(0);
)

Ndef(\myBass).stop(2)




// I call "cycles" notation this way of writing musical data where you specify an Array (list) with scale degrees, or sample names, etc, and duration values are *derived* from the way the array is written.

// More specifically, the *total number of items* in the array will be equally spread over the *total number of beats* specified in the Pbind (\stretch factor).

// examples

// [a, b, c, d] with a \stretch of 4 beats will play 'a' on beat 1, 'b' on beat 2, 'c' on beat 3, 'd' on beat 4, and repeat.

// [ a, b, c, [d, d] ] with a \stretch of 4 will do the same as above, but beat 4 will be further split into two halves, playing 'd' twice (as "eighth notes").