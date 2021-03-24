# SCLOrkPieces

This repository contains complete materials for pieces that SCLOrk has performed over the years. It also includes some teaching demos and examples.
SCLOrk is the Santa Clara Laptop Orchestra.

Typical installation can be done directly from SuperCollider as a Quark:

`Quarks.install("https://github.com/SCLOrkHub/SCLOrkPieces")`

Some of the folders are pointers to other github repositories. To get all their content, you can run the [download-submodules.scd](download-submodules.scd) file once. For convenience, the same code is also copied here:

```
// This assumes you have installed SCLOrkPieces as a Quark in the default Quarks folder, like so:
Quarks.install("https://github.com/SCLOrkHub/SCLOrkPieces");

// There should be a SCLOrkPieces folder here (look in the Post window):
(
var path = Quarks.folder;
("cd " ++ path ++ "; ls -l").unixCmd;
)

// If so, now you can run this to download submodules inside SCLOrkPieces:
(
var path = Quarks.folder +/+ "SCLOrkPieces";
("cd " ++ path ++ "; git submodule update --init").unixCmd;
)
```
## Full List of Quarks used by SCLOrk

```
Quarks.fetchDirectory;
Quarks.install("adclib", "ff6174cbd4d4e1d0c09d2b51f58245c11401d555");
Quarks.install("HyperDisCo");
Quarks.install("StartupFile");
Quarks.install("SCLOrkTools");
Quarks.install("SCLOrkSynths");
Quarks.install("ddwSnippets");
Quarks.install("SafetyNet");
Quarks.install("https://github.com/SCLOrkHub/SCLOrkPieces");
Quarks.install("Dirt-Samples");
```
After installing, recompile class library and run:
```
(Quarks.folder +/+ "SCLOrkPieces/Settings/Move-Startup-File-To-Right-Place.scd").load;
```
Then select the All-In-One start up file by running this line and clicking on the right button:
```
StartupFile.select;
```
Next time you restart SuperCollider you should see the "enter your username" screen and the Red Butz GUI afterwards.
