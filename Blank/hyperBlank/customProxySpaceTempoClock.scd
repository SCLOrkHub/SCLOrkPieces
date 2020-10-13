/*
Resets all Ndefs, load ProxySpace TempoClock
*/

var bpm = 120;

// Clear all
Ndef.clear;


// This creates a general purpose clock that Ndefs can use; also quants all proxies to 1 beat
p = Ndef(\tempo).proxyspace.makeTempoClock(bpm/60).quant_(1.0);


// Creates a convenience Ndef to act as metronome wherever an Impulse can be used
Ndef(\t, { Impulse.ar(Ndef(\tempo)) }); // we'll use Ndef(\t) to get a trigger on the clock

// shortcut to change bpm:

// ~bpm.(120);

("Metronome running at " ++ bpm ++ " BPM.").postln;
