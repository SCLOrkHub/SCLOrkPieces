// ============================================================
// TOCCATA V3 - Pandemic version
// A SCLOrk version of Toccata by Joo Won Park
// Original score here: http://www.joowonpark.net/Toccata.pdf

// THIS FILE ADAPTED FOR SPRING 2021 CLASS

// Run one line at a time. Watch Post window for messages

// ============================================================
// 1) IF NOT ALREADY RUNNING, START JACKTRIP from Red Button
// (will open a terminal window, just leave it alone)

// ============================================================
// 2) RUN THIS (it will boot server automatically)
(Quarks.folder +/+ "SCLOrkPieces/Toccata/Toccata_SynthDefs.scd").load;

// Before running next line, wait until you see message "SynthDefs added" in Post window

// ============================================================
// 3) RUN THIS:
(Quarks.folder +/+ "SCLOrkPieces/Toccata/Toccata_GroupBussesBuffer.scd").load;

// ============================================================
// 4) ...AND NOW THIS (it will launch GUI)
(Quarks.folder +/+ "SCLOrkPieces/Toccata/Toccata_ButtonActions.scd").load;

// ============================================================
// 5) DO THIS:
// - TURN ON MIDI ON BUTTON QUNEO MIRROR GUI (ON YOUR LAPTOP SCREEN)
// - BRING UP VERTICAL FADERS 1, 3, 4 ON QUNEO HARDWARE
// - BRING LONG SLIDER (PAN) TO MIDDLE ON QUNEO HARDWARE

// ============================================================
// 6) AUTOMATICALY REDO ALL JACK CONNECTIONS:
(Quarks.folder +/+ "SCLOrkPieces/Settings/JackTrip-Patch-1.scd").load;





// Bruno only (if using MIDI keyboard):
"zynaddsubfx --output jack --no-gui --load-instrument=\"/usr/share/zynaddsubfx/banks/Organ/0068-Square Organ.xiz\"".runInTerminal;

(
SCLOrkJack.connectAllFrom([
	List[ "zynaddsubfx:out_1", "SuperCollider:in_1" ],
	List[ "zynaddsubfx:out_2", "SuperCollider:in_2" ],
	List[ "a2j:PCR [28] (capture): PCR 1", "zynaddsubfx:midi_input" ]])
)



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