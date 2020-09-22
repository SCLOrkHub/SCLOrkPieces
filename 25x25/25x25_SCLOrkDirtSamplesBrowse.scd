/*
what this file does:

Assuming Dirt samples are loaded into a dictionary saved under variable 'd',

this file creates a GUI to browse all samples by name

*/

// Window.closeAll;
if( (~browseWindow.isNil) || (~browseWindow.isClosed), {

	~alphabeticalSamples = d.keys.asArray.sort; //copyRange(0, 250);
	~browseWindow = Window.new("dirt-samples [scroll down for more]", Rect(10, 10, 1265, 700), resizable: false, scroll: true);
	~browseWindow.view.decorator = FlowLayout(~browseWindow.view.bounds, 5@5, 5@5);
	~alphabeticalSamples.do({ |key| Button(~browseWindow, 100@25)
		.states_([
			[key, Color.black, Color.white],
			[key, Color.white, Color.black]
		])
		// .mouseDownAction_({ |b| b.valueAction = 1 })
		.action_({ arg button;
			if(button.value==1,
				{
					var buffer, channels;
					buffer= d.at(key);
					channels = buffer.numChannels;
					[buffer, channels, key].postln;
					if((buffer.notNil) && (channels.notNil), {
						r = Routine.run(
							func: {
								{ Limiter.ar(
									in: PlayBuf.ar(
										numChannels:  channels,
										bufnum: buffer,
										rate: BufRateScale.kr(buffer),
										doneAction: 2
									),
									level: 0.1
								)}.play;
								buffer.duration.wait;
								button.value = 0;
							},
							clock: AppClock
						);
					}, { [key, "nil stuff"].postln });
				},{
					s.freeAll
			});
		});
	});
	~browseWindow.front;
	~browseWindow.onClose({ ~browseWindow = nil; "wow".postln; });
}, {
	~browseWindow.unminimize;
	~browseWindow.front;
});
