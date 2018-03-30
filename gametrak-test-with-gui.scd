
// Preliminary set up
HID.findAvailable;
HID.postAvailable;

~myhid = HID.open( 5303, 2434 );

// =========================================================
// Calibration
// Run block below, then bring left tether to your desired max height position
// note: raw numbers from GameTrak are: 1.0=bottom, 0.0=top
// =========================================================

(

~calibrated_Top = 1.0; // just a initial value

HIDdef.usage(
	key: \left_v,
	func: {
		arg currentValue;
		if(currentValue < ~calibrated_Top, { ["new value", currentValue.round(0.001)].postln });
		~calibrated_Top = min(currentValue, ~calibrated_Top);

	},
	elUsageName: \X // left up and down
);

)// end of calibration code

// hit control+period to stop calibration
// check calibrated value here:

~calibrated_Top;


// ==============
// RUN THE GUI
// ==============

(
// some variables
~lh_vertical = 0.0;
~lh_sideways = 0.0;
~lh_frontback = 0.0;
~rh_vertical = 0.0;
~rh_sideways = 0.0;
~rh_frontback = 0.0;
~footswitch = 0;

HIDdef.freeAll;

// BUTTON (FOOT SWITCH)
HIDdef.usage( \button, { |value| ~footswitch = value; }, \b1 );

// LEFT HAND STUFF:
HIDdef.usage(\left_v, { arg value; ~lh_vertical = value }, \X );
HIDdef.usage( \left_s, { |value| ~lh_sideways = value }, \Joystick );
HIDdef.usage( \left_fb, { |value| ~lh_frontback = value }, \Pointer );


// RIGHT HAND STUFF:
HIDdef.usage( \right_v, { |value| ~rh_vertical = value }, \Rx );
HIDdef.usage( \right_s, { |value| ~rh_sideways = value }, \Y );
HIDdef.usage( \right_fb, { |value| ~rh_frontback = value }, \Z );

// GUI
~win_width = 800;
~win_height = 500;

~dotL_width = 50;
~dotL_height = 50;
~dotL_left = 0;
~dotL_top = 0;

~dotR_width = 50;
~dotR_height = 50;
~dotR_left = 0;
~dotR_top = 0;

~dotL_size = 1;
~dotR_size = 1;

~dotL_color = Color.white;
~dotR_color = Color.black;

Window.closeAll;

~win = Window.new("GameTrak GUI", Rect(10, 10, ~win_width, ~win_height)).front ;


// left pane
~leftView = UserView(~win, Rect(0, 0, ~win_width / 2, ~win_height)).background_(Color.black) ;
~leftView.drawFunc_{
	Pen.fillColor = ~dotL_color;
	Pen.addOval(
		Rect(
			left: ~dotL_left,
			top: ~dotL_top,
			width: ~dotL_width * ~dotL_size,
			height: ~dotL_height * ~dotL_size)
	);
	Pen.fill
};
~leftView.clearOnRefresh_(true);

// right pane
~rightView = UserView(~win, Rect(~win_width / 2, 0, ~win_width / 2, ~win_height)).background_(Color.white) ;
~rightView.drawFunc_{
	Pen.fillColor = ~dotR_color;
	Pen.addOval(
		Rect(
			left: ~dotR_left,
			top: ~dotR_top,
			width: ~dotR_width * ~dotR_size,
			height: ~dotR_height * ~dotR_size)
	);
	Pen.fill
};
~rightView.clearOnRefresh_(true);

r = {

	inf.do{
		~dotL_top = ~lh_vertical.linlin(~calibrated_Top, 1.0, 0, ~win_height - ~dotL_height);
		~dotL_left = ~lh_sideways.linlin(0.0, 1.0, 0, (~win_width / 2) - ~dotL_width);
		~dotR_top = ~rh_vertical.linlin(~calibrated_Top, 1.0, 0, ~win_height - ~dotR_height);
		~dotR_left = ~rh_sideways.linlin(0.0, 1.0, 0, (~win_width / 2) - ~dotR_width);
		~dotL_size = ~lh_frontback.linexp(0.0, 1.0, 3, 0.25);
		~dotR_size = ~rh_frontback.linexp(0.0, 1.0, 3, 0.25);

		{
			if(~footswitch==1, {
				~dotL_color = Color.red;
				~dotR_color = Color.red;
			}, {
				~dotL_color = Color.white;
				~dotR_color = Color.black;
			});

			~leftView.refresh;
			~rightView.refresh

		}.defer;
		0.05.wait;
		// [~dotL_top, ~dotL_left].postln;
	}
}.fork;
)
