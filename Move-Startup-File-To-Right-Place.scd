// YOU ONLY HAVE TO DO THIS ONCE EVER
// The code below will automatically make a copy of startup_25x25.scd into the right SC folder

(
var file = "".resolveRelative ++ "All-In-One-Startup-File.scd";
var destination = StartupFile.filesDir;
var command;

Platform.case(
    \osx,       {
		destination = destination.replace("Application Support", "Application\\ Support");
		file = file.replace("Application Support", "Application\\ Support");
	},
	\linux,     { "nothing" },
	\windows,   { "nothing" }
);

command = ("cp " ++ file ++ " " ++ destination);
command.postln;
command.unixCmd;
)