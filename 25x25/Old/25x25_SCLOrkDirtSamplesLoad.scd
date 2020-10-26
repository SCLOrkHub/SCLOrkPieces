/*
what this file does

-- loads ca. 2000 samples from dirt-samples
-- saves them into a dictionary, accessible by key, eg.

d.hit0

or

d[\hit0]

*/


// s.quit;
// s.options.numBuffers = 3000;
// s.options.memSize = 8192 * 100; // 100 times the default

if( d.isNil, {
	s.waitForBoot({

		p = PathName.new(Quarks.folder ++ "/Dirt-Samples");

		d = IdentityDictionary.new(n: 2500, know: true); // know: true makes the dictionary interpret method calls as look ups.

		// add a symbol \r for rests

		d.put(\r, \rest);

		Routine.run({

			p.folders.do({ |thisFolder|

				thisFolder.entries.do({ |thisFile, count|
					var key, buffer, extension, allowedExtensions;
					extension = thisFile.extension;
					allowedExtensions = ["wav", "WAV", "aif", "AIF", "aiff", "AIFF", "aifc", "AIFC"];
					if(allowedExtensions.includesEqual(extension), {
						key = (thisFolder.folderName ++ count).asString;
						key = if(key[0].asString.asInteger==0, { key }, {"a"++key});
						key = key.asSymbol;
						buffer = Buffer.read(
							server: s,
							path: thisFile.fullPath
						);
						// s.sync;
						0.015.wait;
						[buffer.bufnum, key].postln;
						d.put(key, buffer);
					}, {
						[extension, "not a wav or aif file"].postln;
					});
				});
			});
		});
	}); // end of waitForBoot
}, {
	"Samples already loaded.".postln;
	"Variable 'd' should contain an Identity Dictionary with % entries:\n".postf(d.size);
	d.postln;
}); // end of if