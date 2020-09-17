// YOU ONLY HAVE TO DO THIS ONCE EVER
// The code below will automatically make a copy of startup_25x25.scd into the right SC folder

(
var file = "~/Music/SCLOrk/25x25/move-startup-file-to-right-place/startup_25x25.scd".standardizePath;
var destination = StartupFile.filesDir;

("cp " ++ file ++ " " ++ destination).unixCmd;
)