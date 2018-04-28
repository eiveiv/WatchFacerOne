using Toybox.System as Sys;

module Time {

	var textWidth;
	var textHeight;
	
	function drawTime(dc, cx, cy) {
	
		var time = Sys.getClockTime();
		var hours = time.hour;
		var minutes = time.min.format("%02d");
        var seconds = time.sec.format("%02d");
        
        
	
	}

}