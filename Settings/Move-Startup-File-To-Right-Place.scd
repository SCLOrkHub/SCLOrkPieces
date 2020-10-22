// YOU ONLY HAVE TO DO THIS ONCE EVER
// The code below will automatically make a copy of this file into the right folder
// Mac ad Linux only

(
var file = "".resolveRelative ++ "All-In-One-Startup-File.scd";
var destination = StartupFile.filesDir;
var command;

Platform.case(
    \osx,       {
		destination = destination.replace("Application Support", "Application\\ Support");
		file = file.replace("Application Support", "Application\\ Support");
	},
	\linux,     { "ok" },
	\windows,   { "please do it manually" }
);

command = ("cp " ++ file ++ " " ++ destination);
command.postln;
command.unixCmd;
)
