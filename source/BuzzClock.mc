using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class BuzzClockView extends Ui.WatchUi {

    function onUpdate(dc) {
        // Get current time
        var time = Sys.getClockTime();
        var hours = time.hour % 12;
        if (hours == 0) { hours = 12; }
        var minutes = time.min;

        // Hours buzz
        for (var i = 0; i < hours; i++) {
            Sys.vibrate(Sys.VIBE_SHORT);
            Sys.sleep(500);
        }

        // Quarter buzz (0 = no buzz, 1 = 15m, 2 = 30m, 3 = 45m)
        var quarter = (minutes / 15).toNumber();
        Sys.sleep(1000);
        for (var j = 0; j < quarter; j++) {
            Sys.vibrate(Sys.VIBE_LONG);
            Sys.sleep(700);
        }

        // Exit after buzzing
        Ui.requestUpdate();
    }
}

class App extends Ui.Widget {
    function initialize() { Widget.initialize(); }
    function getView() { return [ new BuzzClockView() ]; }
}
