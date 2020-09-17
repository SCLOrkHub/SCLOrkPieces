/*

-- raw trump sample

plus some Ndef stuff

*/

Ndef.clear;

~trump = Buffer.read(s, "trump-coronavirus-mono.wav".resolveRelative);

// This Ndef just plays back the trump sample continuously;
Ndef(\raw, { PlayBuf.ar(1, ~trump, loop: 1) });


// This creates a general purpose clock that Ndefs can use; also quants all proxies to 1 beat

p = Ndef(\tempo).proxyspace.makeTempoClock(150/60).quant_(1.0);


// Creates a convenience Ndef to act as metronome wherever an Impulse can be used
Ndef(\t, { Impulse.ar(Ndef(\tempo)) }); // we'll use Ndef(\t) to get a trigger on the clock

"".postln;
"Trump buffer loaded and playing under Ndef(\\raw)".postln;
"TempoBusClock started at 150 BPM".postln;
"Ndef(\\t) is available as a 150 BPM 'trigger metronome'".postln;
"End of NdefSetup file".postln;



