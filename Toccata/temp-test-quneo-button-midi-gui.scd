MIDIClient.init;

MIDIClient.destinations; // find QuNeo name

// Use that name here:
~toQuNeo = MIDIOut.newByName("QUNEO", "QUNEO MIDI 1");


// some example action for a button
~b1_action = { arg bt; if(bt==0, {"DUH".postln}, {"WOW".postln}) };

~b1_action.value(0)

// some GUI demo
(
Window.closeAll;
w = Window.new("QuNeo In and Out");

b = Button(w, Rect(20, 20, 340, 300))
        .states_([
	            ["click to turn on", Color.black, Color.white],
	            ["click to turn off", Color.white, Color.black],
        ])
        .action_({ arg button;

	// do action
	~b1_action.value(button.value);
	// update QuNeo
	case
	{button.value==0} { ~toQuNeo.noteOff(0, 1, 0), ~toQuNeo.noteOff(11, 36, 0) }
	{button.value==1} { ~toQuNeo.noteOn(0, 1, 127) };
        });
w.front;
)

~toQuNeo.noteOff(11, 36, 0);
(
MIDIdef.noteOn(\testON, { arg vel, note;
	// do ON action
	~b1_action.value(1);
	// update GUI
	{ b.value = 1 }.defer;
	"note ON".postln;
}, noteNum: 36);

MIDIdef.noteOff(\testOFF, { arg vel, note;
	// do OFF action
	~b1_action.value(0);
	// update GUI
	{ b.value = 0 }.defer;
	"note OFF".postln

},
noteNum: 36);

)
MIDIFunc.trace(false);







//ButtonA
buttonA = Button(window,Rect(250,20,300,30));
buttonA.states = [
	["Start Tocccata",Color.black,Color.red],
	["Stop Tocccata",Color.black,Color.white],
	["Click to Reset",Color.white,Color.black]
];
buttonA.action =
{ arg butt;
	if (butt.value ==1,
		{mixerA = Synth("MixerA");
			micbuffer = Synth("MicBuffer");
			//~network.sendMsg(\videoindex,2);~network.sendMsg(\texton,0);
	});
	if (butt.value ==2,
		{mixerA.free;
			//~network.sendMsg(\videoindex,0)
	});
	if (butt.value ==3,
		nothing=1);
};

//Dummy Button
buttonA = Button(window,Rect(600,400,180,70));
buttonA.states = [
	["By Joo Won Park\nHacked for SCLOrk\nby MₓEₓ",Color.black,Color.yellow],
];

//Fader1
text1 = 	TextField(window,Rect(30,440,50,30));
text1.string = "Mic";

fader1 = Slider(window, Rect(40, 250, 34, 180));
fader1.action = { arg slider;
	NodeControl(mixerA,1).value = slider.value};

//Fader2
text2 = 	TextField(window,Rect(100,440,50,30));
text2.string = "Reverb";

fader2 = Slider(window, Rect(110, 250, 34, 180));
fader2.action = { arg slider;
	NodeControl(mixerA,2).value = slider.value};

//Fader3
text3 = 	TextField(window,Rect(170,440,50,30));
text3.string = "Master";

fader3 = Slider(window, Rect(180, 250, 34, 180));
fader3.action = { arg slider;
	NodeControl(mixerA,3).value = slider.value};

//NumRepeatsFader4
text4 = 	TextField(window,Rect(240,440,50,30));
text4.string = "Spawn";

fader4 = Slider(window, Rect(250, 250, 34, 180));
fader4.action = { arg slider;
	fader4REPEATS = ((slider.value).linlin(0, 1, 10, 20)).round(1);
	fader4REPEATS.postln;};
/////////////////////////////////////////////////
});
if (butt.value ==2,
	{
		"".postln
});
};

