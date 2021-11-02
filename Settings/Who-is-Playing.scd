// simple notification system to post list of who is playing every few seconds

(
~whosPlaying = {
	loop({
		var total = 0;
		var list = List.new;

		Ndef.dictFor(s).do({ |i|
			if(i.isMonitoring, {
				list.add(i);
				total = total + 1;
			})
		});
		"".postln;
		(total.asString ++ " PLAYER(S) CURRENTLY ACTIVE").postln;
		list.do({ |i| i.postln });
		"".postln;
		8.wait;
	});
}.fork;
)

~whosPlaying.stop;