
Pbindef.clear;
~clock = TempoClock.new(2).permanent_(true);


(
Pbindef(\p1,
    \degree, Pseq([0, 2, 0, 2, 0, 2], inf),
    \dur, Pseq([0.05, 0.95], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p1).stop;
Pbindef(\p2,
    \degree, Pseq([0, 2, 3, 2], inf),
    \dur, Pseq([0.05, 0.45, 0.5, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p2).stop;
Pbindef(\p3,
    \degree, Pseq([\rest, 2, 3, 2], inf),
    \dur, Pseq([Rest(0.5), 0.5, 0.5, 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p3).stop;
Pbindef(\p4,
    \degree, Pseq([\rest, 2, 3, 4], inf),
    \dur, Pseq([Rest(0.5), 0.5, 0.5, 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p3).stop;
Pbindef(\p4,
    \degree, Pseq([\rest, 2, 3, 4], inf),
    \dur, Pseq([Rest(0.5), 0.5, 0.5, 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p4).stop;
Pbindef(\p5,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)