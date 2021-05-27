{
	SCLOrkJack.disconnectAll;

	1.wait;

	SCLOrkJack.connectAllFrom([
		List[ "system:capture_1", "SuperCollider:in_1" ],
		List[ "system:capture_2", "SuperCollider:in_2" ],
		List[ "SuperCollider:out_1", "system:playback_1" ],
		List[ "SuperCollider:out_2", "system:playback_2" ]
	]);

	SCLOrkJack.preset(\quneo);

}.fork;

	