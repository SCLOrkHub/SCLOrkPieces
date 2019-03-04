// ===================================
// 1. If using wiimote, make sure to
// open Purr-Data first and pair your
// wiimote. Then run this line to get
// wiimote data into SC:

"/home/sclork/Music/SCLOrk/Demos/Wiimote-Test/SuperCollider-OSC-Wiimote-to-Busses-Template.scd".load;


// ================================
// 2. Load all Ndef docs at once:
(
Document.current.dir.postln;
(Document.current.dir ++ "/*.scd").resolveRelative.pathMatch.do({ arg path; Document.open(path) });
)

// **********!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*
// PRO-TIP: Make sure you have the Documents docklet visible (menu View > Docklets > Documents)





// After playing: if you want to close all files at once:
Document.closeAll;