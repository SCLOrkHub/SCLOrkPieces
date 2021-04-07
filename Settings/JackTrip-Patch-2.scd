s.waitForBoot({

	SCLOrkJack.listPorts;

	// START FRESH: Disconnect any and all existing Jack connections just to be safe
	SCLOrkJack.disconnectAll;

	// Now Make ONLY the Jack connections we want:

	// Mics 1-2 straight to JackTrip
	SCLOrkJack.connect("system:capture_1", "JackTrip:send_1");
	SCLOrkJack.connect("system:capture_2", "JackTrip:send_2");

	// Receive JackTrip directly into SC 1-2 (only AudioChat Ndef will pass it through)
	SCLOrkJack.connect("JackTrip:receive_1", "SuperCollider:in_1");
	SCLOrkJack.connect("JackTrip:receive_2", "SuperCollider:in_2");

	// SuperCollider 1-2 to K6 sytem playback 1-2, which is reroute via cable to K6 in 3-4
	SCLOrkJack.connect("SuperCollider:out_1", "system:playback_1");
	SCLOrkJack.connect("SuperCollider:out_2", "system:playback_2");

	// K6 reroutes post-knob signal to headphones 3-4
	SCLOrkJack.connect("system:capture_3", "system:playback_3");
	SCLOrkJack.connect("system:capture_4", "system:playback_4");

	SCLOrkJack.preset(\quneo);

}); // end of waitForBoot