// TOCCATA V3 - Pandemic version
// A SCLOrk version of Toccata by Joo Won Park
// Original score here: http://www.joowonpark.net/Toccata.pdf

// THIS FILE FIRST USED FOR JULY 2020 PERFORMANCE
// July 2020 version for Network Music Festival
// February 2021 version for Music at Noon

// Run one line at a time. Watch Post window for messages

// Note: Temporary changes in SynthDefs file makes it 2 channels (duplicate mono)


// 1) IF NOT ALREADY RUNNING, START JACKTRIP
// (will open a terminal window, just leave it alone)

"xfce4-terminal -x bash -c \"jacktrip -C cmn20.stanford.edu -K % --nojackportsconnect; exec bash\" --hold".format(~hostname).unixCmd;

// 2) RUN THIS (it will boot server automatically)
(Quarks.folder +/+ "SCLOrkPieces/Toccata/Toccata_SynthDefs.scd").load;

// Before running next line, wait until you see message "SynthDefs added" in Post window

// 3) RUN THIS:

(Quarks.folder +/+ "SCLOrkPieces/Toccata/Toccata_GroupBussesBuffer.scd").load;

// 4) ...AND NOW THIS (it will launch GUI)
(Quarks.folder +/+ "SCLOrkPieces/Toccata/Toccata_ButtonActions.scd").load;

// - TURN ON MIDI ON QUNEO GUI
// - BRING UP VERTICAL FADERS 1, 3, 4
// - BRING LONG SLIDER (PAN) TO MIDDLE

// 5) REDO ALL JACK CONNECTIONS:
(Quarks.folder +/+ "SCLOrkPieces/Toccata/SCLOrk_JackTrip_Setup_July_2020.scd").load;





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