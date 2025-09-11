using Toybox.WatchUi as WatchUi;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Attention as Attention;
using Toybox.Lang as Lang;

class BuzzClockView extends WatchUi.View {
    function initialize() {
        WatchUi.View.initialize();
    }

    function onShow() {
        WatchUi.View.onShow();
    }

    function onUpdate(dc) {
        dc.clear();
        var w = dc.getWidth();
        var h = dc.getHeight();
        var now = Sys.getClockTime();
        var timestr = Lang.format("%02d:%02d", now.hour, now.min);
        dc.drawText(w/2, h/2, Gfx.FONT_LARGE, timestr, Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(0, h-20, Gfx.FONT_SMALL, "Press OK → Buzz", Gfx.TEXT_JUSTIFY_LEFT);
    }

    function onSelect() {
        var now = Sys.getClockTime();
        var hour = now.hour % 12;
        if (hour == 0) hour = 12;
        var quarter = (now.min / 15).toNumber(); // 0..3

        // helper: play n short buzzes (each buzz + short pause)
        function buzzN(n, vibMs, pauseMs) {
            for (var i = 0; i < n; i++) {
                // VibeProfile(lengthMillis, dutyPercent)
                Attention.vibrate([ new Attention.VibeProfile(vibMs, 50),
                                    new Attention.VibeProfile(pauseMs, 0) ]);
            }
        }

        // Hours
        if (hour > 0) {
            buzzN(hour, 160, 180);
        }

        // short separator pause
        Attention.vibrate([ new Attention.VibeProfile(400, 0) ]);

        // Quarter (1..3) or if exact hour give a single long buzz
        if (quarter > 0) {
            buzzN(quarter, 160, 180);
        } else {
            Attention.vibrate([ new Attention.VibeProfile(300, 50) ]);
        }
    }
}
