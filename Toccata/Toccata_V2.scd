//Toccatasu
//for SuperCollider and Found Objects
//by Joo Won Park
//Last Updated: 2012.12.23
//Tested with SuperCollider 3.6 on Macbook Pro
// V2 by Miles Elliott, 2017.03.07, Santa Clara University

//Instruction:
//1.Select all and hit Shift+Return (or Menu->Language->Evaluate File)
//2.Click buttons


var window,text1,text2,text3,text4,
	onButton,
	buttonA,button1,button2,button3,button4,button5,
	button6,button7, button8,button9,button10,button11,button12,button13, button2b,
	fader1,fader2,fader3,fader4,
	object1,object2,object3,object3rec,object3out,object4,
	object5,object6,object7,object8,object9,object10,object10rec,object10out,
	object11, object12, object13, object2b,
	buffer1,buffer2,buffer3,buffer4,buffer5,buffer6,buffer1b,
	nothing,micbuffer,mixerA,autotime;

var fader4REPEATS = 10;

~controlwindow = Window.new;
~controlwindow.front;
~controlwindow.bounds_(Rect(1000,670,280,100));

~button1 = Button(~controlwindow,Rect(20,10,240,30));
~button1.states = [
			["Start SuperCollider",Color.black,Color.red],
			["Launch Toccata (Wait 5 sec)",Color.black,Color.green],
			["Click to restart the patch",Color.black,Color.gray]
			];
~button1.action = { arg butt;
			if (butt.value ==1,
				{
				s.quit;
				s.options.memSize = 57344*2;
				s.options.maxNodes = 1024*2;
				s.boot;
				s.recHeaderFormat_('AIFF');
				s.recSampleFormat_('int16');
				s.recChannels_(2);

				});
			if (butt.value ==2,
				{

////////////////////////////////////////////
//GUI Frame Size
window = Window.new;
window.front;
window.bounds_(Rect(160,100,800,500));


//Microphone & Buffers (Pre outlet1)
buffer1 = Buffer.alloc(s, 44100 * 1.0, 1);
buffer1b = Buffer.alloc(s, 44100 * 1.3, 1);
buffer2 = Buffer.alloc(s, 44100 * 1.0, 1);
buffer3 = Buffer.alloc(s, 44100 * 3.0, 1);
buffer4 = Buffer.alloc(s, 44100 * 3.0, 1);
buffer5 = Buffer.alloc(s, 44100 * 3.0, 1);
buffer6 = Buffer.alloc(s, 44100 * 1.0, 1);

SynthDef("MicBuffer",{
		arg micout = 99;
		var mic;

		mic = HPF.ar( AudioIn.ar([1,2]),100);
		mic = Mix.new(mic*([0.dbamp,0.dbamp])); // multiply gain when not using preamp
		Out.ar(micout,mic);
	}).send(s);

//Object1 = Pitch Shift With Env
SynthDef("Object1",{arg  outlet1=101, gate =1;
			var playbuf,pshift,panstereo, env, envelop,lfo;

			env = Env.new([ 0.0001, 0.05,0.95],[0.2,0.6], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:10);

			playbuf = In.ar(99,1);
			pshift = PitchShift.ar(playbuf,2.0,1.0,0.3+envelop,1.7);

			panstereo = Pan2.ar(pshift,SinOsc.ar(0.5+SinOsc.kr(0.4,mul:1.5)));
			Out.ar(outlet1, panstereo*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button1
button1 = Button(window,Rect(40,80,200,30));
button1.states = [
			["Pitch Variation: OFF",Color.black,Color.magenta],
			["Pitch Variation: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button1.action =
			{ arg butt;
				if (butt.value ==1,
					{object1 = Synth.before(mixerA,"Object1")});
				if (butt.value ==2,
					{object1.release(2)});
				if (butt.value ==3,
					nothing=1);
			};

//Object2 = Pitch Shift With Env & Buffer
SynthDef("Object2",{arg outlet1=101, gate =1,recstop=1;
			var playbuf,pshift,panstereo, env, envelop;

			RecordBuf.ar(In.ar(99,1), buffer1.bufnum, run:recstop);

			env = Env.new([ 0.0001, 0.3,1.7],[0.4,1.6], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:10);

			playbuf = PlayBuf.ar(1,buffer1.bufnum,loop:1);
			pshift = PitchShift.ar(playbuf,1.0,1.4,0.3+envelop,0.5);
			panstereo = Pan2.ar(pshift,SinOsc.ar(0.5+SinOsc.kr(0.4,mul:1.5)));
			Out.ar(outlet1, panstereo*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button2
button2 = Button(window,Rect(40,120,200,30));
button2.states = [
			["Looping Pitch Var: OFF",Color.black,Color.magenta],
			["Looping Pitch Var: ON",Color.black,Color.green],
			["Looping Pitch Var: LOOPING",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button2.action =
			{ arg butt;
				if (butt.value ==1,
					{object2 = Synth.before(mixerA,"Object2")});
				if (butt.value==2,
					{
						Routine({
						var repeats =3,counter =1, wtime,counterx;
						repeats.do({
								("Loop Count:  "++counterx).postln;
								if(counter == repeats, {object2.set(\recstop,0)});
								counter =counter+1;
								counterx = repeats-counter;
								wtime = 1.0;
								wtime.wait
					});
			}).play

					}
				    );
				if (butt.value ==3,
					{object2.release(4)});
				if (butt.value ==4,
					nothing=1);
			};

//Object2b = Pitch Shift With Env & Buffer
SynthDef("Object2b",{arg outlet1=101, gate =1,recstop=1;
			var playbuf,pshift,panstereo, env, envelop;

			RecordBuf.ar(In.ar(99,1), buffer1b.bufnum, run:recstop);

			env = Env.new([ 0.0001, 0.4,5.7],[0.4,1.56], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:10);

			playbuf = PlayBuf.ar(1,buffer1b.bufnum,loop:1);
			pshift = PitchShift.ar(playbuf,1.0,1.4,0.3+envelop,0.7);
			panstereo = Pan2.ar(pshift,SinOsc.ar(0.5+SinOsc.kr(0.4,mul:1.5)));
			Out.ar(outlet1, panstereo*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button2b
button2b = Button(window,Rect(40,160,200,30));
button2b.states = [
			["Looping Pitch Var2: OFF",Color.black,Color.magenta],
			["Looping Pitch Var2: ON",Color.black,Color.green],
			["Looping Pitch Var2: LOOPING",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button2b.action =
			{ arg butt;
				if (butt.value ==1,
					{object2b = Synth.before(mixerA,"Object2b")});
				if (butt.value==2,
					{
						Routine({
						var repeats =3,counter =1, wtime,counterx;
						repeats.do({
								("Loop II Count:  "++counterx).postln;
								if(counter == repeats, {object2b.set(\recstop,0)});
								counter =counter+1;
								counterx = repeats-counter;
								wtime = 1.0;
								wtime.wait
					});
			}).play

					}
				    );
				if (butt.value ==3,
					{object2b.release(4)});
				if (butt.value ==4,
					nothing=1);
			};



//Object3 = Pitch Shift With Env & Buffer & Spawn
SynthDef("Object3Rec",{arg recstop=1;
			RecordBuf.ar(In.ar(99,1), buffer2.bufnum, run:recstop);
			}).send(s);

SynthDef("Object3",{arg outlet2=110, gate =1,spawnvar=0.0;

			var playbuf,pshift,panstereo, env, envelop;

			env = Env.new([ 0.0001, 0.3,0.7],[0.4,1.6], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:4);

			playbuf = PlayBuf.ar(1,buffer2.bufnum,loop:1);
			pshift = PitchShift.ar(playbuf,1.0,2.0,0.3+envelop+spawnvar,0.5);
			panstereo = Pan2.ar(pshift,SinOsc.ar(0.3));

				Out.ar(outlet2, panstereo*EnvGen.kr(Env.linen(sustainTime: rrand(5, 10)), gate:gate, doneAction:2));
			}).send(s);

SynthDef("Object3Out",{arg outlet1=101,gate=1;
			var playbuf,env,envelop;
			playbuf=Limiter.ar(In.ar(110,2),0.75,0.1);

			Out.ar(outlet1, playbuf*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button3
button3 = Button(window,Rect(40,200,200,30));
button3.states = [
			["Spawning PitchVar: OFF",Color.black,Color.magenta],
			["Spawning PitchVar: ON",Color.black,Color.green],
			["Spawning PitchVar: LOOPING",Color.black,Color.green],
			["Spawning PitchVar: SPAWNING",Color.black,Color.green],
			["Click to Reset ",Color.white,Color.black]
			];
button3.action =
{ arg butt;
var repeats;
	if (butt.value ==1,
		{object3rec=Synth.before(mixerA,"Object3Rec");
		object3 = Synth.before(mixerA,"Object3");
		object3out=Synth.before(mixerA,"Object3Out")
		};

		);
	if (butt.value==2,
		{object3rec.set(\recstop,0)});
	if (butt.value ==3,
		{
			repeats = fader4REPEATS; //This will determine how many times Object3 will spawn
			r =Routine({
			var counter =1, wtime,rrate0,rrate,vvol;
			repeats.do({
			("Spawn # :  "++counter).postln;
			if(counter == repeats, {("Last ONE!!!".postln)});
			counter = counter+1;

			rrate0 = 5.rand2;
			rrate = (rrate0*0.1)+0.8;
			vvol = 0.5.rand;
			Synth.new("Object3", [\spawnvar,2.0.rand]);
			wtime = 1.0+(3.rand);
			wtime.wait
			});
			}).play
		});
	if (butt.value ==4,
		{object3out.release(7)});
	if (butt.value ==5,
		{
		object3rec.free;
		object3.free;
		object3out.free})
};

//Object4 = Large Grain With Env
SynthDef("Object4",{arg  outlet1=101, gate =1;
			var playbuf,pshift,pshift2,panstereo,panstereo2, mix,env, envelop;

			env = Env.new([ 0.0001, 0.05,0.95],[0.0001,0.1], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:10);

			playbuf = In.ar(99,1);
			pshift = PitchShift.ar(playbuf,0.2,1.0,0.3,0.1+envelop);
			pshift2 = PitchShift.ar(pshift,0.1,2.0,0.4,0.05);
			panstereo = Pan2.ar(pshift,SinOsc.ar(16));
			panstereo2 = Pan2.ar(pshift2,SinOsc.ar(14.5));
			mix = Mix.new([panstereo,panstereo2]);
			Out.ar(outlet1, 1.4*mix*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button4
button4 = Button(window,Rect(300,250,200,30));
button4.states = [
			["Grainy Sound: OFF",Color.black,Color.cyan],
			["Grainy Sound: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button4.action =
			{ arg butt;
				if (butt.value ==1,
					{object4 = Synth.before(mixerA,"Object4")});
				if (butt.value ==2,
					{object4.release(2)});
				if (butt.value ==3,
					nothing=1);
			};

//Object5 = Delay Evolving PShift
SynthDef("Object5", {
	arg out = 101,gate =1,recstop=1;
	var playbuf,delay1,delay2,delay3,delay4, dtime1, dtime2,dtime3,time,
	    mix, mix2,decay,
	    env,env2,pshift,pshift2,pvar,
	    toscil,toscil2,toscil3,filter;

	RecordBuf.ar(In.ar(99,1), buffer3.bufnum, run:recstop);
	time = 10; //sets evolution time

	dtime1 = XLine.kr(0.58,0.007,time*0.6);
	dtime2 = XLine.kr(0.43,0.005,time*0.8);
	dtime3 = XLine.kr(0.24,0.005,time*0.7);

	toscil = Dust.kr(16,mul:0.006);
	toscil2 = Dust.kr(9,mul:0.006);
	toscil3 = Dust.kr(5,mul:0.006);

	playbuf = PlayBuf.ar(1,buffer3.bufnum,loop:1);
	playbuf = Pan2.ar(playbuf,0);

	delay1 = CombC.ar(playbuf,1.0,
				[dtime1+toscil,dtime2+toscil2],0.5);
	delay2 = PitchShift.ar(delay1,3.0,1.0,0.3,1.0);

	delay3 = CombC.ar(playbuf,1.0,
				toscil3,0.5);
	delay4 = PitchShift.ar(delay3,3.0,1.0,0.7,1.0);
	delay4 = Pan2.ar(delay4,0);

	decay = XLine.kr(0.4,0.002,50);
	mix = Mix.new([playbuf*decay,delay2*0.8,delay4*0.7]);
	filter = BPF.ar(mix, 2000,0.1,add:mix);
	mix2 = Limiter.ar(filter,0.8,0.03);
	Out.ar(out, 0.7*mix2* EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2))
}).send(s);

//Button5
button5 = Button(window,Rect(300,120,200,30));
button5.states = [
			["Mechanical Popcorn: OFF",Color.black,Color.yellow],
			["Mechanical Popcorn: ON",Color.black,Color.green],
			["Mechanical Popcorn: LOOPING",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button5.action =
			{ arg butt;
				if (butt.value ==1,
					{object5 = Synth.before(mixerA,"Object5")});
				if (butt.value==2,
					{object5.set(\recstop,0)});
				if (butt.value ==3,
					{object5.release(15)});
				if (butt.value ==4,
					nothing=1);
			};
//Object 6 = Delay Evolving Pshift II
SynthDef("Object6", {
			arg out = 101,gate =1, recstop=1;
			var kin, playbuf,delay1,dtime1, mix,mix2,filter,
			env,env2,pshift,pshift2,pvar,toscil,toscil2, dryline;

			kin = In.kr(99,1);
			RecordBuf.ar(In.ar(99,1), buffer4.bufnum, run:recstop);

			playbuf = PlayBuf.ar(1,buffer4.bufnum,loop:1);
			env = Env.new([ 2.0, 0.8,0.1,0.05,0.013  ],[0.2,0.3,0.1,0.4], 'exponential' );
			dtime1 = EnvGen.kr(env, timeScale:24); //determines evolution time

			delay1 = CombC.ar(playbuf,4.0,dtime1,0.4);

			env2 = Env.new([ 0.01, 0.01,3.0],[0.4,0.6], 'exponential' );
			pvar  = EnvGen.kr(env2,timeScale:60);
			toscil = SinOsc.kr(0.2,mul:0.007);
			toscil2 = SinOsc.kr(0.2,mul:0.007);
			pshift = CombC.ar(delay1, 4.2, [(dtime1*2)+toscil,(dtime1*2.002)+toscil2],0.05);
			pshift2 = PitchShift.ar(pshift,2.15,1.0,pvar,2.12);
			dryline = XLine.kr(0.9,0.07,80);

			mix = Mix.new([playbuf*0.9,delay1*0.9,pshift*0.7]);
			mix = Mix.new([mix*dryline,pshift2]);
			mix = LPF.ar(mix, 20000);
			filter = BPF.ar(mix, 1800,0.2,1.8,mix);
			mix2 = Limiter.ar(filter,0.9,0.03);

			Out.ar(out, 0.4*mix2 * EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
		}).send(s);

//Button6
button6 = Button(window,Rect(300,160,200,30));
button6.states = [
			["Mechanical Phraser: OFF",Color.black,Color.yellow],
			["Mechanical Phraser: ON",Color.black,Color.green],
			["Mechanical Phraser: LOOPING",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button6.action =
			{ arg butt;
				if (butt.value ==1,
					{object6 = Synth.before(mixerA,"Object6")});
				if (butt.value==2,
					{object6.set(\recstop,0)});
				if (butt.value ==3,
					{object6.release(18)});
				if (butt.value ==4,
					nothing=1);
			};

//Object7 = amp controlled noise
SynthDef("Object7",{ arg out =101,gate =1;
	var input, bufferx,buffer7,modulator, modulator2,process;

	input = In.ar(99,1);

	modulator = SinOsc.ar([0.2,0.3],mul:[9,10],add:10);
	modulator2 = SinOsc.ar(modulator,[0,180],mul:[1.5,1.4]);

	process =  PitchShift.ar(input,[0.02,0.043],1.6+modulator2);
	Out.ar(out,[process.at(0),process.at(1)],EnvGen.kr(Env.asr(15, 0.8, 1.3), gate, doneAction:2));


}).send(s);

//button7
button7 = Button(window,Rect(550,80,200,30));
button7.states = [
			["Drastic Pitch Mod: OFF",Color.white,Color.blue],
			["Drastic Pitch Mod: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button7.action =
			{ arg butt;
				if (butt.value ==1,
					{object7 = Synth.before(mixerA,"Object7")});
				if (butt.value ==2,
					{object7.release(6)});
				if (butt.value ==3,
					nothing=1);
			};

//Object8 = Low Thump
		SynthDef("Object8",{arg outlet1=101, gate =1;
			var playbuf,pshift,panstereo1,panstereo2,mix, env, envelop,
			     modulation;

			playbuf = In.ar(99,1);
			playbuf = HPF.ar(playbuf,100);
			//pshift = PitchShift.ar(playbuf,0.2,[0.2,0.1],0.04,0.05);
			pshift = PitchShift.ar(playbuf,0.2,1,[0.04,0.06],[0.18,0.19]);

			Out.ar(outlet1,pshift*EnvGen.kr(Env.asr(0.2, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button8
button8 = Button(window,Rect(550,120,200,30));
button8.states = [
			["For Long Tone: OFF",Color.white,Color.blue],
			["For Long Tone: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button8.action =
			{ arg butt;
				if (butt.value ==1,
					{object8 = Synth.before(mixerA,"Object8")});
				if (butt.value ==2,
					{object8.release(5)});
				if (butt.value ==3,
					nothing=1);
			};

//Object9 = Reverse (Good for speech)
SynthDef("Object9",{arg outlet1=101, gate =1,recstop=1;
			var playbuf,pshift,panstereo1,panstereo2,mix, env, envelop;

			RecordBuf.ar(In.ar(99,1), buffer5.bufnum, run:recstop);

			env = Env.new([ 0.0001, 0.3,0.7],[0.001,0.2], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:10);

			playbuf = PlayBuf.ar(1,buffer5.bufnum,-1,loop:1);
			pshift = PitchShift.ar(playbuf,1.0,[0.7,0.6],envelop,0.5);
			panstereo1 = Pan2.ar(pshift.at(0),SinOsc.ar(5));
			panstereo1 = CombC.ar(panstereo1*0.5,2.0,1.5,0.2,add:panstereo1*0.8);
			panstereo2 = Pan2.ar(pshift.at(1),SinOsc.ar(7));
			panstereo2 = CombC.ar(panstereo2*0.5,2.0,1.88,0.4,add:panstereo2*0.8);
			mix =Mix.new([panstereo1,panstereo2]);
			Out.ar(outlet1, mix*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button9
button9 = Button(window,Rect(550,160,200,30));
button9.states = [
			["Looping Reverse: OFF",Color.white,Color.blue],
			["Looping Revers: ON",Color.black,Color.green],
			["Looping Revers: LOOPING",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button9.action =
			{ arg butt;
				if (butt.value ==1,
					{object9 = Synth.before(mixerA,"Object9")});
				if (butt.value==2,
					{object9.set(\recstop,0)});
				if (butt.value ==3,
					{object9.release(8)});
				if (butt.value ==4,
					nothing=1);
			};


//Object11 = Large Grain With Env
SynthDef("Object11",{arg  outlet1=101, gate =1;
			var playbuf,pshift,pshift2,panstereo,panstereo2, mix,env, envelop;

			env = Env.new([ 0.0001, 0.05,1.5],[0.0001,0.1], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:8);

			playbuf = In.ar(99,1);
			pshift = PitchShift.ar(playbuf,0.1,2.0,1.3,0.1+envelop);
			pshift2 = PitchShift.ar(pshift,0.14,2.0,0.5,0.05);
			panstereo = Pan2.ar(pshift,SinOsc.ar(3));
			panstereo2 = Pan2.ar(pshift2,SinOsc.ar(2.7));

			mix = Mix.new([panstereo,panstereo2]);
			Out.ar(outlet1, 0.7*mix*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button11
button11 = Button(window,Rect(300,290,200,30));
button11.states = [
			["Grainy SoundHigh: OFF",Color.black,Color.cyan],
			["Grainy SoundHigh: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button11.action =
			{ arg butt;
				if (butt.value ==1,
					{object11 = Synth.before(mixerA,"Object11")});
				if (butt.value ==2,
					{object11.release(7)});
				if (butt.value ==3,
					nothing=1);
			};

//Object12 = Large Grain With Env
SynthDef("Object12",{arg  outlet1=101, gate =1;
			var playbuf,pshift,pshift2,panstereo,panstereo2, mix,env, envelop;

			env = Env.new([ 0.0001, 0.05,1.5],[0.0001,0.1], 'exponential' );
			envelop = EnvGen.kr(env,timeScale:8);

			playbuf = In.ar(99,1);

			pshift = PitchShift.ar(playbuf,0.2,0.8,0.3,0.1+envelop);
			pshift2 = PitchShift.ar(pshift,0.24,1.0,0.5,0.05);
			panstereo = Pan2.ar(pshift,SinOsc.ar(3.3));
			panstereo2 = Pan2.ar(pshift2,SinOsc.ar(7.54));

			mix = Mix.new([panstereo,panstereo2]);
			Out.ar(outlet1, mix*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button12
button12 = Button(window,Rect(300,330,200,30));
button12.states = [
			["Grainy SoundLow: OFF",Color.black,Color.cyan],
			["Grainy SoundLow: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button12.action =
			{ arg butt;
				if (butt.value ==1,
					{object12 = Synth.before(mixerA,"Object12")});
				if (butt.value ==2,
					{object12.release(5)});
				if (butt.value ==3,
					nothing=1);
			};

//Object13 = Pitch Shift With Env
SynthDef("Object13",{arg  outlet1=101, gate =1;
			var playbuf,pshift,panstereo, env, envelop,lfo;

			playbuf = In.ar(99,1);

			lfo = SinOsc.ar(0.34,mul:0.7);
			pshift = PitchShift.ar(playbuf,0.1,1.3+lfo);

			panstereo = Pan2.ar(pshift, 0.0+(SinOsc.kr(2.3,mul:0.3)));
			Out.ar(outlet1, panstereo*EnvGen.kr(Env.asr(0.1, 0.8, 1.3), gate, doneAction:2));
			}).send(s);

//Button13
button13 = Button(window,Rect(550,200,200,30));
button13.states = [
			["Pitch Modulation: OFF",Color.white,Color.blue],
			["Pitch Modulation: ON",Color.black,Color.green],
			["Click to Reset",Color.white,Color.black]
			];
button13.action =
			{ arg butt;
				if (butt.value ==1,
					{object13 = Synth.before(mixerA,"Object13")});
				if (butt.value ==2,
					{object13.release(2)});
				if (butt.value ==3,
					nothing=1);
			};

//MixerA
SynthDef("MixerA",{
			arg out =0,micbal=1.0,revbal = 0.0,mastervol =1.0;
			var 	micin,inlet1,drymic,
				drymix,wetmix,mix,
				output;

			micin=In.ar(99,1);
			inlet1= In.ar (101,2);



			drymix = Mix.new([micin*micbal,inlet1*1.4]);
			wetmix = drymix;
			7.do({ wetmix = AllpassN.ar(wetmix, 0.043, [0.038.rand,0.036.rand],3.5) });

			//drymic = AudioIn.ar(1)*micbal;

			output = Mix.new([wetmix*revbal,drymix*(1.0-revbal)]);
			output = HPF.ar(output, 150);

			Out.ar(out,output*mastervol)
		}).send(s);

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

