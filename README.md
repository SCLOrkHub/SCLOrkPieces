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

So the full list of Quarks typically used by SCLOrk are:
```
Quarks.fetchDirectory;
Quarks.install("HyperDisCo");
Quarks.install("StartupFile");
Quarks.install("SCLOrkTools");
Quarks.install("SCLOrkSynths");
Quarks.install("Dirt-Samples");
Quarks.install("ddwSnippets");
Quarks.install("https://github.com/SCLOrkHub/SCLOrkPieces");
```
