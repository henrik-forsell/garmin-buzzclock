using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Time as Time;
using Toybox.Haptics as Haptics;

class BuzzClock extends Ui.Widget {

    // Called when the widget is shown
    function onShow() {
        // Nothing happens until user presses OK
    }

    // Called when a button is pressed
    function onKey(key, state, duration) {
        // Check for OK button (press and release)
        if (key == Ui.BUTTON_SELECT && state == Ui.KEY_PRESS) {
            buzzTime();
        }
    }

    // Main vibration routine
    function buzzTime() {
        var now = Time.now();
        var hour = now.hour;
        var minute = now.min;

        // Convert to 12-hour format
        var hour12 = hour % 12;
        if (hour12 == 0) hour12 = 12;

        // Vibrate hours
        vibratePattern(hour12);

        // Short pause before quarter
        Sys.sleep(500);

        // Vibrate quarter hours (0-3)
        var quarter = minute / 15;
        vibratePattern(quarter);
    }

    // Vibrate N times with short interval
    function vibratePattern(count) {
        for (var i = 0; i < count; i++) {
            Haptics.vibrate(Haptics.VIBRATION_SHORT);
            Sys.sleep(300);
