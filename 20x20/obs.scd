/*
obs file
*/

// DECEMBER 2020
// STOP YOUR SERVER





















// Friday stream key
// um6m-gdd9-1w2j-1fdu-d9k9

// Bruno's test stream key
// u67b-541h-jep0-zph6-1uvd
















// looks like no need for Limiter if we have Safety quark installed!


// really the only step needed here may be the limiter

// ARE YOU PRIVATE??? YOU SHOULD!!!

// Be sure you are PRIVATE before running this
// OPEN LIMITER FIRST
"calfjackhost \"Limiter\" &".unixCmd;

// MAKE CONNECTIONS
(
// Remove all previous connections
SCLOrkJack.disconnectAll;

// Connect SC to Limiter
SCLOrkJack.connect("SuperCollider:out_1", "Calf Studio Gear:Limiter In #1");
SCLOrkJack.connect("SuperCollider:out_2", "Calf Studio Gear:Limiter In #2");

// Connect Limiter to OBS
SCLOrkJack.connect("Calf Studio Gear:Limiter Out #1", "JACK Input Client:in_1");
SCLOrkJack.connect("Calf Studio Gear:Limiter Out #2", "JACK Input Client:in_2");

// Connect Limiter to local speakers
SCLOrkJack.connect("Calf Studio Gear:Limiter Out #1", "system:playback_1");
SCLOrkJack.connect("Calf Studio Gear:Limiter Out #2", "system:playback_2");
)


Safety.limit











// if jack patchbay is active, this step is not needed!
// after OBS is  or SC restarted BEFORE PUBLIC

(
SCLOrkJack.connect("SuperCollider:out_1", "JACK Input Client:in_1");
SCLOrkJack.connect("SuperCollider:out_2", "JACK Input Client:in_2");
)







// after PUBLIC

~openVideo.value(1); // open to all

~startVideoAndSCLOrkWatch.value(1);

(
~rewindVideo.value(1);
~closeSCLOrkWatch.value;
)



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





// not needed? OBS has the link to video file as a "VLC SOURCE"

// start video
// "vlc --fullscreen --no-video-title-show --start-time 0.0 ~/Desktop/video-version-2020-09-21.mp4".unixCmd;

// start video PAUSED
// "vlc --start-paused --no-video-title-show --start-time 0.0 ~/Desktop/video-version-2020-09-21.mp4".unixCmd;

Ndef(\cmn20).clear;

// TEST
(
var samples;
samples = [\bd0, \techno0, \bd0, \techno1, \cp0, \drum2, \techno1, \drum2];
// samples = [\techno2, \bd0, \cp0, \cp1];
// samples = [\bubble3!2, \house3!rrand(1, 3), \house2!2, \cp0];
// samples = [\glitch23!2, \birds4, \can6!2, \ifdrums0!2]; //BIRD
// samples = [\glitch20, \e7!2, \bass1, \can7]; // NICE
// samples = [\sid1!2, \sid7, \sid9!2, \sf1!2];
// samples = [\amencutup0, [\drum2, \drum2], \drum0!2, \drum1, \hh3, \techno1, \amencutup13, \techno1];

Ndef(\cmn20).quant = 4;
Ndef(\cmn20,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.9,
		\rate, Pwhite(1, 1.01) * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

Ndef(\cmn20).stop;
Ndef(\cmn20).play;






