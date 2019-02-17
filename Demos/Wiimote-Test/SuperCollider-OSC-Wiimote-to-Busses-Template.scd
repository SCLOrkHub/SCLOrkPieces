// Basic Wiimote test - send wiimote values to control busses
// You need to have wiimote-main.pd open in Purr Data

var bHome = 0;
var b1 = 0, b2 = 0;
var bDown = 0, bUp = 0, bLeft = 0, bRight = 0;
var bA = 0, bB = 0;
var bPlus = 0, bMinus = 0;

~wiiX = Bus.control(s, 1).set(0.0);
~wiiY = Bus.control(s, 1).set(0.0);
~wiiZ = Bus.control(s, 1).set(0.0);
~wiiPitch = Bus.control(s, 1).set(0.0);
~wiiRoll = Bus.control(s, 1).set(0.0);
~wiiHome = Bus.control(s, 1).set(0.0);
~wii1 = Bus.control(s, 1).set(0.0);
~wii2 = Bus.control(s, 1).set(0.0);
~wiiDown = Bus.control(s, 1).set(0.0);
~wiiUp = Bus.control(s, 1).set(0.0);
~wiiLeft = Bus.control(s, 1).set(0.0);
~wiiRight = Bus.control(s, 1).set(0.0);
~wiiA = Bus.control(s, 1).set(0.0);
~wiiB = Bus.control(s, 1).set(0.0);
~wiiPlus = Bus.control(s, 1).set(0.0);
~wiiMinus = Bus.control(s, 1).set(0.0);


// print X axis messages (control period to stop)
OSCdef.new(\aX, { arg msg; ~wiiX.value = msg[1] }, '/wii/axis/x');

// print Y axis messages
OSCdef.new(\aY, { arg msg; ~wiiY.value = msg[1] }, '/wii/axis/y');

// print Z axis messages
OSCdef.new(\aZ, { arg msg; ~wiiZ.value = msg[1] }, '/wii/axis/z');

// print PITCH messages
OSCdef.new(\pitch, { arg msg; ~wiiPitch.value = msg[1] }, '/wii/pitch');

// print ROLL messages
OSCdef.new(\roll, {arg msg; ~wiiRoll.value = msg[1] }, '/wii/roll');


OSCdef.new(\bHome, {arg msg;
	msg.postln;
	case
	{ (bHome==0) && (msg[1]==1) }{ bHome = 1; ~wiiHome.value = 1 }
	{ (bHome==1) && (msg[1]==0) }{ bHome = 0; ~wiiHome.value = 0 };
}, '/wii/button/home');

OSCdef.new(\b1, {arg msg;
	msg.postln;
	case
	{ (b1==0) && (msg[1]==1) }{ b1 = 1; ~wii1.value = 1 }
	{ (b1==1) && (msg[1]==0) }{ b1 = 0; ~wii1.value = 0 };
}, '/wii/button/1');

OSCdef.new(\b2, {arg msg;
	msg.postln;
	case
	{ (b2==0) && (msg[1]==1) }{ b2 = 1; ~wii2.value = 1 }
	{ (b2==1) && (msg[1]==0) }{ b2 = 0; ~wii2.value = 0 };
}, '/wii/button/2');

OSCdef.new(\bDown, {arg msg;
	msg.postln;
	case
	{ (bDown==0) && (msg[1]==1) }{ bDown = 1; ~wiiDown.value = 1 }
	{ (bDown==1) && (msg[1]==0) }{ bDown = 0; ~wiiDown.value = 0 };
}, '/wii/button/down');

OSCdef.new(\bUp, {arg msg;
	msg.postln;
	case
	{ (bUp==0) && (msg[1]==1) }{ bUp = 1; ~wiiUp.value = 1 }
	{ (bUp==1) && (msg[1]==0) }{ bUp = 0; ~wiiUp.value = 0 };
}, '/wii/button/up');

OSCdef.new(\bLeft, {arg msg;
	msg.postln;
	case
	{ (bLeft==0) && (msg[1]==1) }{ bLeft = 1; ~wiiLeft.value = 1 }
	{ (bLeft==1) && (msg[1]==0) }{ bLeft = 0; ~wiiLeft.value = 0 };
}, '/wii/button/left');

OSCdef.new(\bRight, {arg msg;
	msg.postln;
	case
	{ (bRight==0) && (msg[1]==1) }{ bRight = 1; ~wiiRight.value = 1 }
	{ (bRight==1) && (msg[1]==0) }{ bRight = 0; ~wiiRight.value = 0 };
}, '/wii/button/right');

OSCdef.new(\bA, {arg msg;
	msg.postln;
	case
	{ (bA==0) && (msg[1]==1) }{ bA = 1; ~wiiA.value = 1 }
	{ (bA==1) && (msg[1]==0) }{ bA = 0; ~wiiA.value = 0 };
}, '/wii/button/a');

OSCdef.new(\bB, {arg msg;
	msg.postln;
	case
	{ (bB==0) && (msg[1]==1) }{ bB = 1; ~wiiB.value = 1 }
	{ (bB==1) && (msg[1]==0) }{ bB = 0; ~wiiB.value = 0 };
}, '/wii/button/b');

OSCdef.new(\bPlus, {arg msg;
	msg.postln;
	case
	{ (bPlus==0) && (msg[1]==1) }{ bPlus = 1; ~wiiPlus.value = 1 }
	{ (bPlus==1) && (msg[1]==0) }{ bPlus = 0; ~wiiPlus.value = 0 };
}, '/wii/button/plus');

OSCdef.new(\bMinus, {arg msg;
	msg.postln;
	case
	{ (bMinus==0) && (msg[1]==1) }{ bMinus = 1; ~wiiMinus.value = 1 }
	{ (bMinus==1) && (msg[1]==0) }{ bMinus = 0; ~wiiMinus.value = 0 };
}, '/wii/button/minus');
