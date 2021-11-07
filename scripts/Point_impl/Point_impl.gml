function Point(x_, y_, tx_, ty_, fixed_ = false) constructor {
	x = x_;
	y = y_;
	x_prev = x_;
	y_prev = y_;
	tx = tx_;
	ty = ty_;
	fixed = fixed_;
	
	static Update = function(dt_) {
		if (fixed) {
			return;
		}
		
		var vx = x - x_prev;
		var vy = y - y_prev + 9.81 * dt_;
		
		x_prev = x;
		y_prev = y;
		
		x += vx; 
		y += vy;
		
		Constrain();
	}
	
	static Constrain = function() {
		if (y > 700) {
			y = 700;
		}
	}
	
	static AddDistance = function(dx_, dy_) {		
		x += dx_;
		y += dy_;
	}
	
	static DebugDraw = function() {		
		draw_point(x, y);
	}
}