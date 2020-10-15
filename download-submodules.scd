// This assumes you have installed SCLOrkPieces as a Quark in the default Quarks folder, like so:
Quarks.install("https://github.com/SCLOrkHub/SCLOrkPieces");

// There should be a SCLOrkPieces folder here (look in the Post window):
(
var path = Quarks.folder;
path = Platform.case(
    \osx,       {
		path.replace("Application Support", "Application\\ Support")
	},
    \linux,     { path },
    \windows,   { path }
);
("cd " ++ path ++ "; ls -l").unixCmd;
)

// If so, now you can run this to download submodules inside SCLOrkPieces:
(
var path = Quarks.folder +/+ "SCLOrkPieces";
path = Platform.case(
    \osx,       {
		path.replace("Application Support", "Application\\ Support")
	},
    \linux,     { path },
    \windows,   { path }
);
("cd " ++ path ++ "; git submodule update --init").unixCmd;
)

Quarks.openFolder