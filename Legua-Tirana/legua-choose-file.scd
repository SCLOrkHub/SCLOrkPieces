// Legua Tirana
// SCLOrk arrangement

// Pick one instrument only

// Clap
~openCopy.(Quarks.folder ++ "/SCLOrkPieces/Legua-Tirana/legua-clap.scd");

// D minor
~openCopy.(Quarks.folder ++ "/SCLOrkPieces/Legua-Tirana/legua-d-minor.scd");

// Shaker 1
~openCopy.(Quarks.folder ++ "/SCLOrkPieces/Legua-Tirana/legua-shaker-1.scd");

// Tabla 1
~openCopy.(Quarks.folder ++ "/SCLOrkPieces/Legua-Tirana/legua-tabla-1.scd");

// Tabla 2
~openCopy.(Quarks.folder ++ "/SCLOrkPieces/Legua-Tirana/legua-tabla-2.scd");








/*

// utility function to open a copy (not the original)
// run once to create the function, then use below
(
~openCopy = { arg path;
	path = PathName.new(path);
	Document.new(
		title: path.fileNameWithoutExtension.asString ++ " copy",
		string: String.readNew(File.new(path.fullPath, "r"));
	).front;
};
)

