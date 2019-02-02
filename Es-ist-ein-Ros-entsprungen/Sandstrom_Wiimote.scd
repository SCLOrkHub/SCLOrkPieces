// Sandstrom Wiimote stuff
// Fall 2013


// NOTE from 2019:

// WiiMote object in SuperCollider has been deprecated as of SC 3.9 or 3.10
// This file should no longer be used.
// Kept here just for historical purposes.
// Instead, use an OSC bridge to get values from wiimote and send as OSC messages to SC.
// Suggestion: use Purr Data with the wiimote-main.pd patch copied in this folder.







//////////////////////
// FIRST STEP
//////////////////////
// Press Wii buttons 1+2 together, then evaluate this line
WiiMote.discover; // wait for post about connected


//////////////////////
// SECOND STEP
// Calibrate: turn wiimote up/down & sideways
// This step automatically boots server
//////////////////////
(
// Let's call this Wiimote "~wii"
~wii = WiiMote.all[0];
// Enable motion sensor and buttons
~wii.enableMotionSensor(1); ~wii.enableButtons(1);
// Create a user interface
g = WiiMoteGUI.new(~wii);
// Boot server!
s.boot;
// Calibrate
~wiiXmin = 0.5;
~wiiXmax = 0.5;
~wiiYmin = 0.5;
~wiiYmax = 0.5;
// Evaluate, turn Wiimote sideways slowly
~wii.setAction(\ax, { arg v;
    ~wiiXmin = min(~wiiXmin, v);
    ~wiiXmax = max(~wiiXmax, v);
});
// Evaluate, turn Wiimote up down slowly
~wii.setAction(\ay, { arg v;
    ~wiiYmin = min(~wiiYmin, v);
    ~wiiYmax = max(~wiiYmax, v);
});
)


//////////////////////
// THIRD STEP
// Clean it up, post calibration
//////////////////////
(
~wii.removeAction(\ax);
~wii.removeAction(\ay);
["X", ~wiiXmin, ~wiiXmax].postln;
["Y", ~wiiYmin, ~wiiYmax].postln;
["battery", ~wii.battery].postln;
// Create bus on the server
~wiiXbus = Bus.control(s, 1).value_(0); // x axis
~wiiYbus = Bus.control(s, 1).value_(0); // y axis
)


//////////////////////
// FOURTH STEP
// Set wiimote actions
//////////////////////
(
~wii.setAction(\ax, { arg v;
    ~wiiXbus.set(v.linlin(~wiiXmin, ~wiiXmax, 0, 1.1)) } );

~wii.setAction(\ay, { arg v;
    ~wiiYbus.set(v.linlin(~wiiYmin, ~wiiYmax, 1.1, -0.1)) } ); // 1-0 for up-down amplitude

// "Home" button: da capo; reset Routine; stop Pbind bell (if there is one running)
~wii.setAction(\bHome, { arg v; if(v==1,
	{~divisi.do({ arg item; item.release }); r.reset; r.next(~startAtMeasure); if(p.notNil, {p.stop; p = nil}); }) });

// "A" button: next move
~wii.setAction(\bA, { arg v; if(v==1, {r.next})});

// "Plus" and "Minus" buttons: choose measure number to start from
~wii.setAction(\bPlus, { arg v; if(v==1, {
	(~startAtMeasure = min(~startAtMeasure + 1, 60)).postln;
	// And in case button remains pushed,
	{
		1.wait;
		while(
			{~wii.at(\bPlus).value==1},
			{(~startAtMeasure = min(~startAtMeasure + 1, 60)).postln; 0.05.wait})
	}.fork;
	}
)});

~wii.setAction(\bMinus, { arg v; if(v==1, {
	(~startAtMeasure = max(~startAtMeasure - 1, 1)).postln;
	// And in case button remains pushed,
	{
		1.wait;
		while(
			{~wii.at(\bMinus).value==1},
			{(~startAtMeasure = max(~startAtMeasure - 1, 1)).postln; 0.05.wait})
	}.fork;
	}
)});
)

//////////////////////
// FIFTH STEP
// Only if you are a bell
//////////////////////

// **************************************************************
(
// ONLY IF YOU ARE A BELL
// "1" button: bell tolling at beginning
~wii.setAction(\bOne, {arg v; if(v==1, { ~playBell.value; r.reset; r.next(~startAtMeasure); })});
)
// **************************************************************















/*

// Test only
{In.kr(~wiiXbus).poll.(3)}.play;
{In.kr(~wiiYbus).poll(3)}.play;

{SinOsc.ar(freq: 1000 + Lag.kr((In.kr(~wiiXbus) * 500), 1), mul: Lag.kr(In.kr(~wiiYbus), 1))}.play;


