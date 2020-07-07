s.waitForBoot({

	SCLOrkJack.listPorts;

	// quick hack in case we need to connect to a different server number (cmnXX)
	~cmnNumber = nil;

SCLOrkJack.collectPorts.do({ |i|
		if(i.find("cmn").notNil, {~cmnNumber = i[3..4].asString})
	});

	// START FRESH: Disconnect any and all existing Jack connections just to be safe
	SCLOrkJack.disconnectAll;

	// Now Make ONLY the Jack connections we want:

	// Korg contact mic to SuperCollider
	SCLOrkJack.connect("system:capture_1", "SuperCollider:in_1");
	// In case you have a second mic:
	SCLOrkJack.connect("system:capture_2", "SuperCollider:in_2");

	// SuperCollider 1-2 to K6 sytem playback 1-2
	SCLOrkJack.connect("SuperCollider:out_1", "system:playback_1");
	SCLOrkJack.connect("SuperCollider:out_2", "system:playback_2");

	// K6 capture 3-4 to cmn17.stanford.edu (jacktrip)
	SCLOrkJack.connect("system:capture_3", "cmn"++~cmnNumber++".stanford.edu:send_1");
	SCLOrkJack.connect("system:capture_4", "cmn"++~cmnNumber++".stanford.edu:send_2");

	// receive cmn17.stanford.edu (jacktrip) to K6 3-4 (headphones)
	SCLOrkJack.connect("cmn"++~cmnNumber++".stanford.edu:receive_1", "system:playback_3");
	SCLOrkJack.connect("cmn"++~cmnNumber++".stanford.edu:receive_2", "system:playback_4");

	SCLOrkJack.preset(\quneo);

}); // end of waitForBoot