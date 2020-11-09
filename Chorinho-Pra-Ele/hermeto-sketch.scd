

(
// in \notes (0=root, 4=M3, 7=P5 etc)
// first note indicates bass note
~chords = (
	x6: [0, 4, 7, 9],
	x7: [0, 4, 7, 10],
	x7bass3: [4, 0, 7, 10],
	x7sus4: [0, 5, 7, 10],
	x9: [0, 4, 7, 10, 14],
	x76: [0, 4, 7, 9, 10],
	x13: [0, 4, 7, 10, 14, 21],
	x7b9: [0, 4, 7, 10, 13],
	maj7: [0, 4, 7, 11],
	maj713: [0, 4, 7, 11, 14, 21],
	min7: [0, 3, 7, 10],
	dim7: [0, 3, 6, 9],
	min9: [0, 3, 7, 10, 14],
);

// NOTE: degree numbers are written here thinking of solfege - do(1), re(2), mi(3), etc. We subtract 1 at end of Array to adjust for Pbind \degrees where first scale degree is 0.

~intro = [
	// degrees
	[
		4, 5, 6, 8, 7b, 8, 9, 11,
		10b, 11, 12, 14b, 13b, 14b, 15, 17b,
		16b, 13b, 11, 9b, 8, 9, 10, 12,
		11, 11
	] - 1,

	// durations
	[
		0.25.dup(24),
		0.75, 0.25
	].flat,

	// root note
	0.dup(26),

	// chords (one per beat)
	[
		~chords.x9 + 5, // F9
		~chords.x76 -2, // Bb7/6
		~chords.x9 + 3, // Eb9
		~chords.x76 -4, // Ab7/6
		~chords.x9 + 1, // Db9
		~chords.x9 + 0, // C9
		~chords.maj7 + 5 // Fmaj7
	]
];


~sectionA1 = [
	// degrees
	[
		\r, 5, 6, 7,
		8, 7, 6, 5, 4, 3, 2, 1s,
		3, 1s, 2, 3, 4, 5, 6, 8,
		7, 6, 5, 4, 3, 2, 1, 0,
		2, 1, 0, 1, 5, 0, 1, 2,
		3b, 4, 5b, 6b, 6, 7, 8, 9, // G diminished
		10, 8, 6, 7, 8, 6, 4, 5,
		6, 4, 2, 1, 0, 6, 5, 4,
		3
	] - 1, // adjust for Pbind \degree

	// durations
	[
		Rest(0.25), 0.25, 0.25, 0.25,
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		1
	].flat,

	// root
	7.dup(61), // G root

	// chords
	[
		~chords.x9 + 2, // D9
		~chords.maj7 - 5, // Gmaj7
		~chords.x6 - 5, // G6
		~chords.min7 - 3, // Am7
		~chords.min7 - 3, // Am7
		~chords.min7 - 3, // Am7
		~chords.x13 + 2, // D13
		~chords.maj7 - 5, // Gmaj7
		~chords.maj7 - 5, // Gmaj7
		~chords.dim7 - 5, // Go7
		~chords.dim7 - 5, // Go7
		~chords.min7 - 3, // Am7
		~chords.min7 - 3, // Am7
		~chords.x13 + 2, // D13
		~chords.x13 + 2, // D13
		~chords.maj7 - 5, // Gmaj7
	]
];


~sectionA2 = [
	// degrees
	[
		\r, 9,
		11, 8, 10b, 7b, 9, 6, 8, 5,
		7b, 4, 6, 3, 5, 2, 4, 8,
		10b, 7b, 9b, 6b, 8, 5, 7b, 4,
		6b, 5, 4, 3b, 2b, 1, 0b, -1b,
		-2, -1, -0, 2, 5, 4, 3, 0,
		2, 1, -4,
		-3s, -2s, 0, 3, 2, 1s, -2s,
		0, -1, \r
	] - 1, // adjust for Pbind \degree

	// durations
	[
		Rest(0.75), 0.25,
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.25.dup(8),
		0.75.dup(3),
		0.25.dup(7),
		0.75, 0.25, Rest(1);
	].flat,

	// roots
	0.dup(55) + 12, // C root

	// chords
	[
		~chords.x6 - 5, // G6
		~chords.min7, // Cm7
		~chords.x13 + 5, // F13
		~chords.maj7 - 2, // Bbmaj7
		~chords.maj7 - 2, // Bbmaj7
		~chords.min7 - 2, // Bbm7
		~chords.x13 + 3, // Eb13
		~chords.maj7 - 4, // Abmaj7
		~chords.maj7 - 4, // Abmaj7
		~chords.min9 + 2, // Dm9
		~chords.x76 - 5, // G76
		~chords.maj7, // Cmaj7
		~chords.x7b9 + 4, // E7b9
		~chords.x7b9 + 4, // E7b9
		~chords.x7bass3 + 4, // E7/G#
		~chords.dim7 - 4, // G#07
		~chords.min7 - 3, // Am7

	]
];


~sectionB = [
	// degrees
	[
		\r, 4,
		5b, 2, 3b, 4, 5b, 6b, 7b, 8,
		10b, 9b, 3, 4, 8, 7b, 1, 2b, 6, 5, 6b,
		5, 5b, 7b, 4, 3b, 1, 0b,
		-1b, \r
	] - 1 + 7,

	// durations
	[
		Rest(0.75), 0.25,
		0.25.dup(8),
		1/6.dup(6),
		1/5.dup(4), 1/5 + 0.25,
		0.25.dup(7),
		1, Rest(1)
	].flat,

	// roots
	0.dup(61) // G major
];


~sectionC = [
	// degrees
	[
		5s, 4, 4s, 5s, 6, 7, 8s, 10,
		12s, 12, 11s, 10, 8, 6, 5s, 4s,

		7, 5s, 6, 7, 8, 9, 10, 12,
		14, 14b, 13, 12, 10, 8, 7, 6,

		9, 7, 8, 9, 10b, 11, 12, 14b,
		16, 16b, 15, 14, 12, 10, 9, 8,

		11, 9, 10b, 11, 12b, 13b, 14b, 16b,
		18, 17, 17b, 16, 14, 12, 11, 10,

		9, 9
	] - 1,

	// durations
	[
		0.125.dup(64),
		0.75, 0.25
	].flat,

	// roots
	0.dup(66),

	// chords
	[
	nil, nil, nil
	]


];

)


~sectionB.flop


~intro.flop


];
)

~bpm.(90);
Ndef.clear
(
Ndef(\bass,
	Pbindef(\bss,
		\instrument, "everythingRhodes",
		\note, Pseq([
			Pseq(~intro[3].flop.first, 1),
			Pseq(~sectionA1[3].flop.first, 1),
			Pseq(~sectionA2[3].flop.first, 1),
			Pseq(~intro[3].flop.first, 1),
		], inf),
		\dur, 1,
		\ctranspose, [-24, -12],
		\amp, 0.1,
		\rel, 0.9
	)
).play.quant_(4);

Ndef(\chords,
	Pbindef(\ch,
		\instrument, "everythingRhodes",
		\note, Pstutter(Pseq([2, 1], inf),
			Pseq([
				Pseq(~intro[3], 1),
				Pseq(~sectionA1[3], 1),
				Pseq(~sectionA2[3], 1),
				Pseq(~intro[3], 1)
			], inf)
		),
		\dur, Pseq([0.75, Pshuf([0.75, 0.5])], inf),
		\ctranspose, 0,
		\amp, 0.2,
		\rel, 0.7
	)
).play.quant_(4);

Ndef(\mel,
	Pbindef(\ody,
		\instrument, "everythingRhodes",
		[\degree, \dur, \root], Pseq([
			Pseq(~intro.flop, 1),
			Pseq(~sectionA1.flop, 1),
			Pseq(~sectionA2.flop, 1),
			Pseq(~intro.flop, 1),
			// Pseq(~sectionC.flop, 1),
			// Pseq(~sectionA1.flop, 1),
		], inf),
		\decay, 1,
		\amp, 0.3,
		\rel, 0.9
	)
).play.quant_(4);
)

Pbindef(\axa, \dur, Pkey(\dur) * 1.5, \rel, 0.3);
Pbindef(\x, \degree, Pkey(\degree) + [0, 7] + Pstutter(4, Prand([-7, 0, 7+7, 3], inf)));

SCLOrkSynths.synthArgs(\FMRhodes2);


(
var a = [1, 2, 3, 5]; // m1, beat 1
var b = [8, 5, 3, 1]; // m3, beat 1


// measure 1
~mel[1] = (
	degrees: a ++ a - 1,
	dur: 0.25.dup(8),
	scale: Scale.mixolydian.dup(8),
	root: [5, 5, 5, 5, 10, 10, 10, 10],
	ctranspose: 0.dup(8)
);

// measure 2
~mel[2] = ~mel[1].copy.root_([3, 3, 3, 3, 8, 8, 8, 8]).ctranpose_(12.dup(8));

// measure 3
~mel[3] = (
	degrees: b ++ a - 1,
	dur: 0.25.dup(8),
	scale: Scale.mixolydian.dup(8),
	root: [1, 1, 1, 1, 0, 0, 0, 0],
	ctranspose: [24, 24, 24, 24, 12, 12, 12, 12]
);

// measure 4
~mel[4] = (
	degrees: [4, 4, \r, 5, 6, 7],
	dur: [0.75, 0.25, Rest(0.25), 0.25, 0.25, 0.25],
	scale: [Scale.mixolydian.dup(2), Scale.major.dup(4)].flat,
	root: [5, 5, 7, 7, 7, 7],
	ctranspose: [12, 12, 0, 0, 0, 0]
);

);


(
~full = (degrees: [], dur: [], scale: [], root: [], ctranspose: []);
~mel.do({ |item, count|
	if(item.notNil, {
		~full.degrees = ~full.degrees ++ item.degrees;
		~full.dur = ~full.dur ++ item.dur;
		~full.scale = ~full.scale ++ item.scale;
		~full.root = ~full.root ++ item.root;
		~full.ctranspose = ~full.ctranspose ++ item.ctranspose;
	})
})
)


~full.ctranspose
Pbindef.all
(
Ndef(\a,
	Pbindef(\b,
		\instrument, "pluck",
		\scale, Pseq(~full.scale, inf),
		\degree, Pseq(~full.degrees, inf),
		\dur, Pseq(~full.dur, inf) * 1.5,
		\root, Pseq(~full.root, inf),
		\ctranspose, Pseq(~full.ctranspose, inf),
		\amp, 0.1
	)
).play.quant_(4);
)





~mel[3].ctranspose
a.root = [1, 2, 1]
a.root



~melodicPatterns = IdentityDictionary.new(know: true);

// pattern that first appears on measure 1, beat 1
~melodicPatterns.put(\p1_1, (
	degrees: [1, 2, 3, 5] - 1, // do re mi sol
	durs: 0.25.dup(4),
	scale: Scale.mixolydian,
	root: 5 // F root
));

// pattern that first appears on measure 3, beat 1
~melodicPatterns.put(\p3_1, (
	degrees: [8, 5, 3, 1] - 1, // do re mi sol
	durs: 0.25.dup(4),
	scale: Scale.mixolydian,
	root: 1, // Db root
	ctranspose: 24

));


(
Ndef(\a,
	Pbindef(\z,
		\instrument, "pluck",
		\scale, Scale.major,
		[\degree, \dur], Pseq([
			Prand([ [0, 1/2], [12, 1/2] ], 1),
			[1, 2],
			[2, 1],
		], inf),
		\amp, 0.1,
		\root, 0
	)
).play.quant_(4);
)


Pbindef(\z, \degree, Pkey(\degree) - [3, 6]);



~melodicPatterns.p1_1.root





(
Ndef(\aa,
	Pbindef(\ae,
		\instrument, "everythingRhodes",
		\note, Pseq([
			~chords.x6,
			~chords.x7,
			~chords.x7bass3,
			~chords.x7sus4,
			~chords.x9,
			~chords.x76,
			~chords.x13,
			~chords.x7b9,
			~chords.maj7,
			~chords.maj713,
			~chords.min7,
			~chords.dim7,
			~chords.min9,
		], inf),
		\dur, 6,
	)
).play.quant_(4);
)