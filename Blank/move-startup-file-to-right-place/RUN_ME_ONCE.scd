// YOU ONLY HAVE TO DO THIS ONCE EVER
// The code below will automatically make a copy of startup_25x25.scd into the right SC folder

(
var file = "".resolveRelative ++ "startup_Blank.scd";
var destination = StartupFile.filesDir;

("cp " ++ file ++ " " ++ destination).unixCmd;
)