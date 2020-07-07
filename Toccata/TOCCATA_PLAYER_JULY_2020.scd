// ***************** //
// July 7th VERSION  //
// ***************** //
// [added quick hack to ensure we connect to no matter what cmnXX machine we are using for jacktrip]

// TOCCATA V3
// A SCLOrk version of Toccata by Joo Won Park
// Original score here: http://www.joowonpark.net/Toccata.pdf

// THIS FILE FOR JULY 2020 PERFORMANCE ONLY
// July 2020 version for Network Music Festival performance over jacktrip

// Run one line at a time. Watch Post window for messages

// Note: Temporary changes in SynthDefs file makes it 2 channels (duplicate mono)


// 1) IF NOT ALREADY RUNNING, START JACKTRIP
// (will open a small terminal window, just leave it alone)
"jacktrip -C cmn17.stanford.edu --nojackportsconnect".runInTerminal;

// 2) RUN THIS (it will boot server automatically)
"Toccata_SynthDefs.scd".loadRelative;

// Before running next line, wait until you see message "SynthDefs added" in Post window

// 3) RUN THIS:
"Toccata_GroupBussesBuffer.scd".loadRelative;

// 4) ...AND NOW THIS (it will launch GUI)
"Toccata_ButtonActions.scd".loadRelative;
// - TURN ON MIDI ON QUNEO GUI
// - BRING UP VERTICAL FADERS 1, 3, 4

// 5) REDO ALL JACK CONNECTIONS:
"SCLOrk_JackTrip_Setup_July_2020.scd".loadRelative;

// 6) OPEN SCLOrkChat as usual



// LONG HORIZONTAL SLIDER IS PANNING (left/right)
// it starts hard panned left (move it to the middle to start the piece there)

// VERTICAL SLIDERS
/*
|   |   |   |   |
|   |   |   |   |
|   |   |   |   |
|DRY|WET|FX |VOL|
|   |   |   |   |
|   |   |   |   |
|   |   |   |   |

DRY: direct mic sent to output
WET: reverb amount (full dry + fx)
FX: global volume for all effects
VOL: master volume (dry+wet+fx)

*/