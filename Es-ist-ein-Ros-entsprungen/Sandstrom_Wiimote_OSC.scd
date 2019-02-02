// Sandstrom Wiimote stuff
// Fall 2013, Rev. Spring 2015 for MAC and OSCulator
// Rev. 2019 for Purr Data OSC bridge on Linux (instead of OSCulator, not available on Linux)

(

///////////////////
// Create Busses //
///////////////////

~wiiXbus = Bus.control(s, 1).value_(0);
~wiiYbus = Bus.control(s, 1).value_(0);


/////////////////////////
// Set wiimote actions //
/////////////////////////

// wiiXbus and wiiYbus.sets
OSCdef.new(
	key: \x,
	func: {arg msg; ~wiiXbus.set(msg[1].linlin(-1, 1, 0, 1.1))},
	path: '/wii/axis/x'
);

OSCdef.new(
	key: \y,
	func: {arg msg; ~wiiYbus.set(msg[1].linlin(-1, 1, 1.1, -0.1))},
	path: '/wii/axis/y'
);

// 'A' button
OSCdef.new(
	key: \bA,
	func: {arg msg; if(msg[1]==1, {r.next})},
	path: '/wii/button/a'
);

// 'Home' button
OSCdef.new(
	key: \bHome,
	func: {arg msg;
		if(
			msg[1]==1,
			{
				~divisi.do
				(
					{
						arg item;
						item.release
					}
				);
				r.reset;
				r.next(~startAtMeasure);
				if(
					p.notNil,
					{
						p.stop;
						p = nil
					}
				);
			}
		)
	},
	path: '/wii/button/home'
);

// 'Plus' and 'Minus' buttons: choose measure number to start from
OSCdef.new(
	key: \bPlus,
	func: {arg v; if(v[1]==1, {(~startAtMeasure = min(~startAtMeasure + 1, 60)).postln})},
	path: '/wii/button/plus'
);

OSCdef.new(
	key: \bMinus,
	func: {arg v; if(v[1]==1, {(~startAtMeasure = max(~startAtMeasure - 1, 1)).postln})},
	path: '/wii/button/minus'
);
)


// //////////////////////
// // FIFTH STEP
// // Only if you are a bell
// //////////////////////
//
// // **************************************************************
// (
// // ONLY IF YOU ARE A BELL
// // "1" button: bell tolling at beginning
(
OSCdef.new(
	\onebutton, {
		arg v;
		if(v[1]==1,{
			~playBell.value;
			r.reset;
			r.next(~startAtMeasure);
		}
		)
	}, '/1'
);
)









/*

// Test only
{In.kr(~wiiXbus).poll.(3)}.play;
{In.kr(~wiiYbus).poll(3)}.play;

{SinOsc.ar(freq: 1000 + Lag.kr((In.kr(~wiiXbus) * 500), 1), mul: Lag.kr(In.kr(~wiiYbus), 1))}.play;


