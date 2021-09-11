function Point(x_, y_, tx_, ty_) constructor {
	x = x_;
	y = y_;
	x_prev = x_;
	y_prev = y_;
	tx = tx_;
	ty = ty_;
	fixed = false;
	
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
	
	txx = 0;
	tyy = 0;
	
	static AddDistance = function(dx_, dy_) {		
		x += dx_;
		y += dy_;
		
		txx = dx_;
		tyy = dy_;
	}
	
	static Draw = function() {		
		// draw_point(x, y);
		draw_line_color(x, y, x + txx * 10, y, c_red, c_red);
		draw_line_color(x, y, x, y + tyy * 10, c_blue, c_blue);
	}
}