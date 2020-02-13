// TOCCATA V3
// A SCLOrk version of Toccata by Joo Won Park
// Original score here: http://www.joowonpark.net/Toccata.pdf
//
// SCLOrk version 3 with SCLOrkQuNeo - January 2020.
//
// Run one line at a time. Watch Post window for messages
// When SCLOrkQuNeo opens, be sure to switch it to TOGGLE mode


"Toccata_SynthDefs.scd".loadRelative;
// Before running next line, wait until you see message "SynthDefs added" in Post window

"Toccata_GroupBussesBuffer.scd".loadRelative;

"Toccata_ButtonActions.scd".loadRelative;


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



