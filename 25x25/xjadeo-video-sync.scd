StartupFile.choose;




"xjadeo -O 7890".unixCmd;
~xjadeo = NetAddr("localhost", 7890);
~xjadeo.sendMsg('/jadeo/quit');
~xjadeo.sendMsg('/jadeo/load', "/home/ruviaro/Downloads/Sep 14.mov");

~xjadeo.sendMsg('/jadeo/load', "/home/sclork/Videos/2020-06-22_SCLOrk_Quick_Setup_Video.mp4");

~xjadeo.sendMsg('/jadeo/osd/framenumber', 1); // show frame number on screen



// If using jack_transport,
~xjadeo.sendMsg('/jadeo/jack/connect');
"echo locate 0 | jack_transport".unixCmd;
"echo play | jack_transport".unixCmd;
"echo stop | jack_transport".unixCmd;


~xjadeo.sendMsg('/jadeo/jack/disconnect'); // disconnect from jack so we can manually seek

// press comma to resize to proper dimensions

// ql video is 60 FPS
// but first frame in demo video lasts 118 frames


~xjadeo.sendMsg('/jadeo/seek', 30*2);


t = TempoClock.new(60/60).permanent_(true);

// test with countdown video works
(
p = Pbind(
	\type, \rest,
	\frame, Pseries(30*2, 1, inf),
	\seek, Pfunc({ |e|
		~xjadeo.sendMsg('/jadeo/seek', e.frame);
	}),
	\dur, 1/30
).play(t, quant: 1);

o = Pbind(
	\degree, Pseq([0, 1, 3, 4], inf),
	\dur, 1/4,
	\legato, 0.24
).play(t, quant: 1)
)

o.stop; p.stop;




(
p = Pbind(
	\type, \rest,
	\frame, Pseries(30*2, 1, inf).trace,
	\seek, Pfunc({ |e|
		~xjadeo.sendMsg('/jadeo/seek', e.frame);
	}),
	\dur, 1/30
).collect({ |event|
    ~lastFrameEvent = event;
}).play(t, quant: Quant(quant: 1, timingOffset: 1/60));

o = Pbind(
	\degree, Pseq([0, 1, 3, 4], inf),
	\dur, 1/4,
	\legato, 0.24,
	\test, Pfunc({
		var f = ~lastFrameEvent[\frame];
		["wow", f].postln;
})
).play(t, quant: 1)
)


p.stop; o.stop;







(
p = Pbind(
	\type, \rest,
	\frame, Pseries(58*60, 1, inf).trace,
	\seek, Pfunc({ |e|
		~xjadeo.sendMsg('/jadeo/seek', e.frame);
	}),
	\dur, 1/4
).play(t, quant: 1);

o = Pbind(
	\degree, 0, //Pseq([0, 1, 3, 4, 5, 6, 7, 8, 9], inf),
	\dur, 1,
	\legato, 0.4,
	\amp, 0
).play(t, quant: 1)
)

