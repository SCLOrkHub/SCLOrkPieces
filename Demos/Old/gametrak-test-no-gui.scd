// Open GameTrak
~myhid = HID.open( 5303, 2434 );

HID.findAvailable;
HID.postAvailable;

HIDdef.freeAll;


// BUTTON (FOOT SWITCH)
HIDdef.usage( \footswitch, { |value| "HS: ".post; [value].postln; }, \b1 );

// LEFT HAND STUFF:
HIDdef.usage( \left_v, { arg value; "LH vertical: ".post; [value].postln; }, \X );
HIDdef.usage( \left_s, { |value| "LH sideways: ".post; [value].postln; }, \Joystick );
HIDdef.usage( \left_fb, { |value| "LH front & back: ".post; [value].postln; }, \Pointer );

// RIGHT HAND STUFF:
HIDdef.usage( \right_v, { |value| "RH vertical: ".post; [value].postln; }, \Rx );
HIDdef.usage( \right_s, { |value| "RH sideways: ".post; [value].postln; }, \Y );
HIDdef.usage( \right_fb, { |value| "RH front & back: ".post; [value].postln; }, \Z );





Ndef(\test, { arg freq, amp, ffreq; LPF.ar(Saw.ar(freq, amp), ffreq) }).play;

Ndef(\test).set(\freq, 100, \amp, 0.05, \ffreq, 1000);

(
HIDdef.usage(
    key: \myX,
    func: { arg value;
        Ndef(\test).set(
            \freq, value.linexp(0, 1, 1000, 100).round(100),
            \ffreq, value.linexp(0, 1, 10000, 1000)
        );
        // Ndef(\test).set(\ffreq, value.linlin(0, 1, 10000, 1000));

    },
    elUsageName: \X
);
)
HIDdef.usage( \myPointer, { |value| Ndef(\test).set(\amp, value.linlin(0, 1, 0, 1)) }, \Pointer );




