// PRESET BUILDING Pbindef Tools

// Pause all Pbindefs:
Pbindef.all.do{|i| i.pause };

// Resume all:
Pbindef.all.do{|i| i.resume(~clock, 4) };

// If everything is broken:
Pbindef.all.do({ |i| i.clear });

// Pause / resume individual Pbindefs:
Pbindef(\p1).pause;
Pbindef(\p2).pause;
Pbindef(\p3).pause;
Pbindef(\p4).pause;
Pbindef(\p5).pause;
Pbindef(\p6).pause;
Pbindef(\p7).pause;
Pbindef(\p8).pause;

Pbindef(\p1).resume(~clock, 4);
Pbindef(\p2).resume(~clock, 4);
Pbindef(\p3).resume(~clock, 4);
Pbindef(\p4).resume(~clock, 4);
Pbindef(\p5).resume(~clock, 4);
Pbindef(\p6).resume(~clock, 4);
Pbindef(\p7).resume(~clock, 4);
Pbindef(\p8).resume(~clock, 4);
