///////////////////////////////////////
// Sandstrom player
// First created in Fall 2013
// Concert with SCU Chamber Singers
// Mission Church, 2013-12-07
// Revision 2019
// Mission Church, 2019-03-08
///////////////////////////////////////


// ================================
// 1. PAIR WIIMOTE WITH PURR-DATA
// ================================
// Open Purr Data, open wiimote-main.pd, and pair wiimote
// Connect to SuperCollider by clicking on 'connect localhost 57120' at bottom of patch
// You only have to do this once.

// ================================
// 2. LOAD SC WIIMOTE FUNCTIONS
// ================================
"Sandstrom_Wiimote_OSC.scd".loadRelative;

// ================================
// 3. LOAD SCORE
// ================================
"Sandstrom_Choir_II_Score.scd".loadRelative;

// ================================
// 4. PAIR WIIMOTE WITH PURR-DATA
// ================================
// Define SATB choice for this particular player. Pick one and run just that one line:
~originalScore = ~sopranorScore;
~originalScore = ~altoScore;
~originalScore = ~tenorScore;
~originalScore = ~bassScore;

// ================================
// 5. LOAD SYNTHS
// ================================
"Sandstrom_SynthDefs.scd".loadRelative;

// ================================
// 6. LOAD PLAYER FUNCTIONS
// ================================
// If you are a SINGER, load these functions:
"Sandstrom_Functions.scd".loadRelative;



// If you are a BELL, load these functions:
"Sandstrom_Functions_for_Bell_Players.scd".loadRelative;


// "HOME" button: da capo (set to start from beginning)
// "A" button: move to next note
// "+" and "-" buttons: choose measure to start from (for rehearsals)









// TEST ONLY.
r.reset
r.next(1);
r.next;
r.stop


// END OF FILE
