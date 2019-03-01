// START HERE
// QUICK START VERSION
// RUN THE CODE BLOCK BELOW ONCE (place your cursor anywhere within)
// It should all the basic one-time setup you need at once...


// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(
~samplesFolder = "/home/sclork/Music/CopyrightSamples";
"PD_Load_Synth_and_Samples.scd".loadRelative;
~timeClient = SCLOrkTimeClient.new;
~clock = SCLOrkClock.new(~timeClient); // THIS NOW SURVIVES CTRL+PERIOD
)
// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


// test if samples loaded OK
a = ~mySamples.at('1983C').play;
a.free;

// SCLOrkPD performance GUI
// Put your player number here, then run it -- just a number, no slashes
// Your player number is your laptop number
(
SCLOrkPD.new(
	playerNumber: 1   , // put your player number here
	presetSearchDir: "/home/sclork/Music/SCLOrk/Demos/PublicDomainTest/Jan30Presets",
	orderByYear: false // false=alphabetical order of presets; true=display reference years
)
)
// Check if SCLOrkClock is alive (note: printing beats will stop at control+period, but CLOCK WILL SURVIVE)
~clock.play({ "server beats: %".format(~clock.beats.mod(4)+1).postln; ^1 });

// Is your SCLOrkChat up and running?
// SCLOrkChat.new(\name);



// DONE!




























// =====================
// OLD VERSION (with explanations, etc)
// =====================

// =========================================
// Adjust the path to your samples folder
// =========================================
~samplesFolder = "/home/sclork/Music/CopyrightSamples";

// =============================
// Load samples and SynthDefs
// =============================
"PD_Load_Synth_and_Samples.scd".loadRelative;

// ============================
// Test if samples loaded OK
// ============================
a = ~mySamples.at('1983C').play;
b = ~mySamples.at('1956A').play;
c = ~mySamples.at('1982A').play;
a.free;
b.free;
c.free;

// ==================================
// SCLOrkTimeClient and SCLOrkCLOck
// ==================================
// Create a new time client, and one SCLOrkCLOck
// This needs to be done ONLY ONCE after you open SuperCollider
// BOTH will survive Ctrl+period
~timeClient = SCLOrkTimeClient.new;
~clock = SCLOrkClock.new(~timeClient); // UPDATE: THIS NOW SURVIVES CTRL+PERIOD

// ========================================
// PRINT THE BEATS IF YOU WANT TO SEE THEM
// ========================================
// If you hit Ctrl+period, you have to run this again to see the beats
~clock.play({ "server beats: %".format(~clock.beats.mod(4)+1).postln; ^1 });

// IF WORKING AT HOME, use a local clock instead of the above clock:
// ~clock = TempoClock(60/60).permanent_(true);



// =====================
// BRIEF EXPLANATION
// =====================

// Open one of my Presets file template, save as with your own name and numbering, and start composing from there.

// The goal is for you to compose one musical loop using a minimum of 4 and a maximum of 8 Pbindefs that run simultaneously.

// I'm calling each of these pre-composed loops as "presets". You will compose one or more "presets" that we can use as backbone of our Public Domain piece. Feel free to create more than one preset and submit to me.

// The best presets will be used to structure the final composition.

// Save each of your presets as a separate file, like "PD_Preset_Bruno-1.scd", "PD_Preset_Bruno-2.scd", etc.

// Each Pbindef plays a "part", much like an orchestral or choral part. So Pbindef(\p1) is player 1, Pbindef(\p2) is player 2, etc. Eventually these Pbindefs will be playing by real individual players in SCLOrk. As you compose, you play them all together in this file to check results. But keep in mind final goal (in a future week) will be to distribute the Pbindefs you create to separate SCLOrk players.

// Change anything other parameter you want, but keep \dur always as 1/8. If you have a very specific need for a triplet, let me know and I'll help you. But a lot of great patterns can be created just with the 1/8 duration, and messing with the amp grid (the list of 0's and 1's).

// You could have all your players using the same sample, or all using different samples, and you can control which portion of the sample is used, etc. Try to keep at least one of the samples in a very recognizable state -- can the audience tell what is one of the songs playing? We want that to happen at least some of the time.

// Refer to the samples folder to see what samples are available. You just need to use the year plus the letter to refer to them inside the Pbindef (for example, '1990A', '1968A', etc). Note it must be inside single quotes.


