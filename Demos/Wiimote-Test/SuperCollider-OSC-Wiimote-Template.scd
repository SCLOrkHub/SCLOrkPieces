// Basic Wiimote test
// You need to have wiimote-main.pd open in Purr Data
// This should get a message from main.pd



// print X axis messages (control period to stop)
OSCdef.new(\aX, {arg msg; msg.postln}, '/wii/axis/x');

// print Y axis messages
OSCdef.new(\aY, {arg msg; msg.postln}, '/wii/axis/y');

// print Z axis messages
OSCdef.new(\aZ, {arg msg; msg.postln}, '/wii/axis/z');

// print PITCH messages
OSCdef.new(\pitch, {arg msg; msg.postln}, '/wii/pitch');

// print ROLL messages
OSCdef.new(\roll, {arg msg; msg.postln}, '/wii/roll');

// Buttons
(
var bHome = 0;
var b1 = 0, b2 = 0;
var bDown = 0, bUp = 0, bLeft = 0, bRight = 0;
var bA = 0, bB = 0;
var bPlus = 0, bMinus = 0;

OSCdef.new(\bHome, {arg msg;
	case
	{ (bHome==0) && (msg[1]==1) }{ bHome = 1; msg.postln }
	{ (bHome==1) && (msg[1]==0) }{ bHome = 0; msg.postln };
}, '/wii/button/home');

OSCdef.new(\b1, {arg msg;
	case
	{ (b1==0) && (msg[1]==1) }{ b1 = 1; msg.postln }
	{ (b1==1) && (msg[1]==0) }{ b1 = 0; msg.postln };
}, '/wii/button/1');

OSCdef.new(\b2, {arg msg;
	case
	{ (b2==0) && (msg[1]==1) }{ b2 = 1; msg.postln }
	{ (b2==1) && (msg[1]==0) }{ b2 = 0; msg.postln };
}, '/wii/button/2');

OSCdef.new(\bDown, {arg msg;
	case
	{ (bDown==0) && (msg[1]==1) }{ bDown = 1; msg.postln }
	{ (bDown==1) && (msg[1]==0) }{ bDown = 0; msg.postln };
}, '/wii/button/down');

OSCdef.new(\bUp, {arg msg;
	case
	{ (bUp==0) && (msg[1]==1) }{ bUp = 1; msg.postln }
	{ (bUp==1) && (msg[1]==0) }{ bUp = 0; msg.postln };
}, '/wii/button/up');

OSCdef.new(\bLeft, {arg msg;
	case
	{ (bLeft==0) && (msg[1]==1) }{ bLeft = 1; msg.postln }
	{ (bLeft==1) && (msg[1]==0) }{ bLeft = 0; msg.postln };
}, '/wii/button/left');

OSCdef.new(\bRight, {arg msg;
	case
	{ (bRight==0) && (msg[1]==1) }{ bRight = 1; msg.postln }
	{ (bRight==1) && (msg[1]==0) }{ bRight = 0; msg.postln };
}, '/wii/button/right');

OSCdef.new(\bA, {arg msg;
	case
	{ (bA==0) && (msg[1]==1) }{ bA = 1; msg.postln }
	{ (bA==1) && (msg[1]==0) }{ bA = 0; msg.postln };
}, '/wii/button/a');

OSCdef.new(\bB, {arg msg;
	case
	{ (bB==0) && (msg[1]==1) }{ bB = 1; msg.postln }
	{ (bB==1) && (msg[1]==0) }{ bB = 0; msg.postln };
}, '/wii/button/b');

OSCdef.new(\bPlus, {arg msg;
		case
	{ (bPlus==0) && (msg[1]==1) }{ bPlus = 1; msg.postln }
	{ (bPlus==1) && (msg[1]==0) }{ bPlus = 0; msg.postln };
}, '/wii/button/plus');

OSCdef.new(\bMinus, {arg msg;
		case
	{ (bMinus==0) && (msg[1]==1) }{ bMinus = 1; msg.postln }
	{ (bMinus==1) && (msg[1]==0) }{ bMinus = 0; msg.postln };
}, '/wii/button/minus');

) // end of buttons code block
