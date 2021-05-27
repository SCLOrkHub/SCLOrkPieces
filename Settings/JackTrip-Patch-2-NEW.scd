s.waitForBoot({

	SCLOrkJack.listPorts;

	// START FRESH: Disconnect any and all existing Jack connections just to be safe
	SCLOrkJack.disconnectAll;

	SCLOrkJack.connectAllFrom([

		// Mic goes to K6 1/2 (so that is passes through big knob)
		List[ "system:capture_1", "system:playback_1" ],
		List[ "system:capture_2", "system:playback_2" ],

		// Mic arrives (post-knob) at K6 3/4 (back cable connection), and is sent up to JackTrip
		// We double send to make it same on both ears
		List[ "system:capture_3", "JackTrip:send_1", "JackTrip:send_2" ],
		List[ "system:capture_4", "JackTrip:send_2", "JackTrip:send_1" ],

		// SC sends directly to 3/4 headphones
		List[ "SuperCollider:out_1", "system:playback_3" ],
		List[ "SuperCollider:out_2", "system:playback_4" ],

		// JackTrip receive goes directly to 3/4 headphones
		// SO: player is always hearing JackTrip (if anyone speaks, everyone hears)
		// AND: in order to speak, player needs to bring up K6 big knob
		List[ "JackTrip:receive_1", "system:playback_3" ],
		List[ "JackTrip:receive_2", "system:playback_4" ],

	]);

	SCLOrkJack.preset(\quneo);
});