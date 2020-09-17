/*

this file creates the ~dursFrom function that extracts duration from an Array

also creates custom event type \dirt which picks mono or stereo synthdef according to given sample

*/

// Some examples


// Custom function - takes in a list and optional cycle duration in beats.
// Returns a list of durations based on the composition of the array
~dursFrom = {|array, dur=1|
    var size = array.size;
    var subdiv = dur / size;
    var result = array.collect({ |item|
        if(item.isArray, {
            ~dursFrom.value(item, subdiv)
        }, {
            subdiv
        });
    });
    result.flat;
};


Event.addEventType(\dirt, {
	~instrument = if(d.at(~sampleName).numChannels == 1, { \pb1 }, { \pb2 });
	~buf = d.at(~sampleName);
	~testFunc = { |number| number * 2 };
	~type = \note;
	currentEnvironment.play;
});

"Utility Functions loaded".postln;






