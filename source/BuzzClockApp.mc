using Toybox.Application as App;
using Toybox.WatchUi as WatchUi;

class BuzzClockApp extends App.AppBase {
    function initialize() {
        App.AppBase.initialize();
    }

    // initial view must return an array whose first element is a View
    function getInitialView() {
        return [ new BuzzClockView() ];
    }
}
