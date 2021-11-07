function Connection(p1_, p2_) constructor{
	p1 = p1_;
	p2 = p2_;
	initial_length = point_distance(p1.x, p1.y, p2.x, p2.y);
	//angle = point_direction(p1.x, p1.y, p2.x, p2.y);
	stiffness = 0.8;
	
	static Update = function() {
		// Length
		var dx = p2.x - p1.x;
		var dy = p2.y - p1.y;
		
		var dist = sqrt(dx * dx + dy * dy);
		var diff = (initial_length - dist) / dist * stiffness;
		
		var x_offset = dx * diff * 0.5;
		var y_offset = dy * diff * 0.5;
		
		if (!p1.fixed) {
			p1.x -= x_offset;
			p1.y -= y_offset;
			
		}
		
		if (!p2.fixed) {
			p2.x += x_offset;
			p2.y += y_offset;
		}
	}	
	
	static DebugDraw = function() {
		draw_line(p1.x, p1.y, p2.x, p2.y);
	}
}