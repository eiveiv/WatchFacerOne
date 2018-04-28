using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class WatchFacerOneView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = Sys.getClockTime();
        var hours = clockTime.hour;
        var seconds = clockTime.sec;
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);
//		System.println(seconds);
        // Update the view
        var view = View.findDrawableById("TimeLabel");
        var batteryView = View.findDrawableById("BatteryLbl");
        batteryView.setText(Sys.getSystemStats().battery);
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(timeString);
        //view.setSize(20,20);
		var stepsView = View.findDrawableById("StepsLbl");
		//stepsView.setText(seconds);
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
