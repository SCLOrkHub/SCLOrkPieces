// YOU ONLY HAVE TO DO THIS ONCE EVER
// The code below will automatically make a copy of startup_25x25.scd into the right SC folder

(
var file = "".resolveRelative ++ "startup_Blank.scd";
var destination = StartupFile.filesDir;

Platform.case(
    \osx,       {
		destination = destination.replace("Application Support", "Application\\ Support");
		file = file.replace("Application Support", "Application\\ Support");
	},
	\linux,     { "nothing" },
	\windows,   { "nothing" }
);

("cp " ++ file ++ " " ++ destination).unixCmd;
)

Quarks.openFolder