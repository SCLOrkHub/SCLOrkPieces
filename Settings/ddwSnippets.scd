// ndef fadeTime
DDWSnippets.put("fadeTime", "Ndef(\\##name##).fadeTime = 0;");

// ndef fadeTime
DDWSnippets.put("stop", "Ndef(\\##name##).stop(5);");

// ndef set
DDWSnippets.put("set", "Ndef(\\##name##).set(\\param, value);");

// ndef vanilla
DDWSnippets.put("ndef",
	"(
Ndef(\\##name##, {
\targ snd, env, pos;
\tenv = ;
\tsnd =  ;
\tpos = 0.0;
\tsnd = Pan2.ar(Mix.ar(snd), pos);
\tsnd = Limiter.ar(snd);
}).play;
)"
);

// add pbind vanilla (inside ndef)
DDWSnippets.put("pbind",
	"(
Ndef(\\##name##,
\tPbind(
\t\t\\instrument, ,
\t\t\\degree, ,
\t\t\\dur, ,
\t\t\\amp, ,
\t\t\\att, ,
\t\t\\rel, ,
\t)
).play;
)"
);

// add pbind wich cycles function for degrees
DDWSnippets.put("degreeCycles",
"(
	var degrees;
	degrees = [##0, 1, 2, 3##];
	Ndef(\\name, // customize name
		\tPbind(
			\t\t\\instrument, \"chooseSynth\" ,
			\t\t\\scale, Scale.major,
			\t\t\\degree, Pseq(degrees.flat, inf),
			\t\t\\dur, Pseq(~dursFrom.(degrees), inf),
			\t\t\\amp, ,
			\t\t\\att, 0.001,
			\t\t\\rel, 2,
			\t)
	).play;
)"
);

// add pbind wich cycles function (for samples)
DDWSnippets.put("samplesCycles",
"(
	var samples;
	samples = [\\bd0, \\techno0, \\bd0, \\cp0!4];
	// samples = [ ];

	Ndef(\\##name##).quant = 0; // customize name
	Ndef(\\name, // customize name
		Pbind(
			\\type, \\dirt,
			\\sampleName, Pseq(samples.flat, inf),
			\\dur, Pseq(~dursFrom.(samples), inf),
			\\stretch, 4,
			\\amp, 0.2,
			\\rate, 1
		)
	).play
)"
);

