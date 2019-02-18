//  Wiimote routing -- wiimote values to control busses
// All values normalized between -1.0 and +1.0, including buttons
// (to take advantage of .range in a live coding situation)

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
OSCdef.new(\aX, { arg msg; ~wiiX.value = msg[1] }, '/wii/axis/x').permanent_(true);

// print Y axis messages
OSCdef.new(\aY, { arg msg; ~wiiY.value = msg[1] }, '/wii/axis/y').permanent_(true);

// print Z axis messages
OSCdef.new(\aZ, { arg msg; ~wiiZ.value = msg[1] }, '/wii/axis/z').permanent_(true);

// print PITCH messages
OSCdef.new(\pitch, { arg msg; ~wiiPitch.value = msg[1] }, '/wii/pitch').permanent_(true);

// print ROLL messages
OSCdef.new(\roll, {arg msg; ~wiiRoll.value = msg[1] }, '/wii/roll').permanent_(true);


OSCdef.new(\bHome, {arg msg;
	msg.postln;
	case
	{ (bHome==1.neg) && (msg[1]==1) }{ bHome = 1; ~wiiHome.value = 1 }
	{ (bHome==1) && (msg[1]==1.neg) }{ bHome = 1.neg; ~wiiHome.value = 1.neg };
}, '/wii/button/home').permanent_(true);

OSCdef.new(\b1, {arg msg;
	msg.postln;
	case
	{ (b1==1.neg) && (msg[1]==1) }{ b1 = 1; ~wii1.value = 1 }
	{ (b1==1) && (msg[1]==1.neg) }{ b1 = 1.neg; ~wii1.value = 1.neg };
}, '/wii/button/1').permanent_(true);

OSCdef.new(\b2, {arg msg;
	msg.postln;
	case
	{ (b2==1.neg) && (msg[1]==1) }{ b2 = 1; ~wii2.value = 1 }
	{ (b2==1) && (msg[1]==1.neg) }{ b2 = 1.neg; ~wii2.value = 1.neg };
}, '/wii/button/2').permanent_(true);

OSCdef.new(\bDown, {arg msg;
	msg.postln;
	case
	{ (bDown==1.neg) && (msg[1]==1) }{ bDown = 1; ~wiiDown.value = 1 }
	{ (bDown==1) && (msg[1]==1.neg) }{ bDown = 1.neg; ~wiiDown.value = 1.neg };
}, '/wii/button/down').permanent_(true);

OSCdef.new(\bUp, {arg msg;
	msg.postln;
	case
	{ (bUp==1.neg) && (msg[1]==1) }{ bUp = 1; ~wiiUp.value = 1 }
	{ (bUp==1) && (msg[1]==1.neg) }{ bUp = 1.neg; ~wiiUp.value = 1.neg };
}, '/wii/button/up').permanent_(true);

OSCdef.new(\bLeft, {arg msg;
	msg.postln;
	case
	{ (bLeft==1.neg) && (msg[1]==1) }{ bLeft = 1; ~wiiLeft.value = 1 }
	{ (bLeft==1) && (msg[1]==1.neg) }{ bLeft = 1.neg; ~wiiLeft.value = 1.neg };
}, '/wii/button/left').permanent_(true);

OSCdef.new(\bRight, {arg msg;
	msg.postln;
	case
	{ (bRight==1.neg) && (msg[1]==1) }{ bRight = 1; ~wiiRight.value = 1 }
	{ (bRight==1) && (msg[1]==1.neg) }{ bRight = 1.neg; ~wiiRight.value = 1.neg };
}, '/wii/button/right').permanent_(true);

OSCdef.new(\bA, {arg msg;
	msg.postln;
	case
	{ (bA==1.neg) && (msg[1]==1) }{ bA = 1; ~wiiA.value = 1 }
	{ (bA==1) && (msg[1]==1.neg) }{ bA = 1.neg; ~wiiA.value = 1.neg };
}, '/wii/button/a').permanent_(true);

OSCdef.new(\bB, {arg msg;
	msg.postln;
	case
	{ (bB==1.neg) && (msg[1]==1) }{ bB = 1; ~wiiB.value = 1 }
	{ (bB==1) && (msg[1]==1.neg) }{ bB = 1.neg; ~wiiB.value = 1.neg };
}, '/wii/button/b').permanent_(true);

OSCdef.new(\bPlus, {arg msg;
	msg.postln;
	case
	{ (bPlus==1.neg) && (msg[1]==1) }{ bPlus = 1; ~wiiPlus.value = 1 }
	{ (bPlus==1) && (msg[1]==1.neg) }{ bPlus = 1.neg; ~wiiPlus.value = 1.neg };
}, '/wii/button/plus').permanent_(true);

OSCdef.new(\bMinus, {arg msg;
	msg.postln;
	case
	{ (bMinus==1.neg) && (msg[1]==1) }{ bMinus = 1; ~wiiMinus.value = 1 }
	{ (bMinus==1) && (msg[1]==1.neg) }{ bMinus = 1.neg; ~wiiMinus.value = 1.neg };
}, '/wii/button/minus').permanent_(true);
