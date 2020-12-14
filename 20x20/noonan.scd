//
// 20x20 NOONAN STARTER CODE
//
// rule of thumb: always close this tab after playing the piece;
// then open a fresh new one to play again (red button "Load New Piece > 20x20")

/*
Info:

Every time you click on red button "Load New Piece" and select "20x20", a new tab will open with a COPY of the contents of your personal starter file. You should live code on that newly open tab. This way you don't have to worry about ever messing up with the starter code, saving unwanted updates, etc.

If you ever need to make actual changes to the starter code, send your new starter file to Bruno to incorporate directly on GitHub, then next time you hit "Update SCLOrk" you will get the latest.

You can also request a change directly through the GitHub interface on your browser: log in to your account, open your file there: https://github.com/SCLOrkHub/SCLOrkPieces/tree/master/20x20 - click the little pen button to edit, make your modifications, then submit as a pull request (Bruno will have to approve before changes take effect in main repository).


DO NOT SAVE THIS TAB

*/





(
var samples;
samples = [\stab9, \stab8];



Ndef(\stabz).quant = 4;
Ndef(\stabz,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 16,
		\amp, 0.5,
		\rate, 1/2// * Pwrand([1, 0.5, -0.91], [9, 3, 1].normalizeSum, inf)
	)
).play
)

Ndef(\stabz).stop(20);





(


var samples;
samples = [\gretsch19, \gretsch6];


Ndef(\cymbalz).quant = 4;
Ndef(\cymbalz,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 4,
		\amp, Pseq([Pwhite(0.3, 0.5, 13), Pn(1, 6)], inf)*0.2,
		\rate, Pseq([Pwhite(1, 2, 11), Pn(3, 4)], inf),
		\pan, Pwhite(-1, 1)
	)
).play

)

Ndef(\cymbalz).stop(20);













(
var samples;
samples = [\glitch25, \glitch25, \glitch25, \r, \r, \glitch25!2, \r, \glitch25, \glitch25!4, \r, \glitch25, \r, \glitch25, \r, \r, \r];


Ndef(\glitches).quant = 4;
Ndef(\glitches,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 16,
		\amp, Pseq([0.4, 0.29, 0.4, 0.3], inf)*1,
		\rate, Pwhite(2, 4),
		\pan, Pwhite(-1, 1)
	)
).play;
)






Ndef(\stabz).stop;
Ndef(\stabz).free;


Ndef(\cymbalz).free(10);



Ndef(\glitches).free(5);



















(
var samples = [\bass20, \r, \r, \bass20!3, \r, \r, \r, \r, \bass20!8, \r];


Ndef(\chaosbass).fadeTime = 4;
Ndef(\chaosbass,
	Pbind(
		\type, \dirt,
		\sampleName, Pseq(samples.flat, inf),
		\dur, Pseq(~dursFrom.(samples), inf),
		\stretch, 0.8,
		\amp, Pseq([Pwhite(0.3, 0.5, 13), Pn(1, 6)], inf)*(1/4),//Pseq([0.4, 0.29, 0.4, 0.3], inf) * 0.6,
		\rate, Pseq([Pwhite(1, 2, 11), Pn(3, 4)], inf),
		\pan, Pwhite(-0.75, 0.75)
	)
).play
)