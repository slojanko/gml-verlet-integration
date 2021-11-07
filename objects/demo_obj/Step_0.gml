// TODO: Reimplement 
//if (mouse_check_button_pressed(mb_left) || mouse_check_button(mb_right)) {
//	var channel_ = animcurve_get_channel(ac_distance, 0);
//	var md_ = 100;
	
//	for(var i = 0; i < height; i++) {
//		for(var j = 0; j < width; j++) {
//			var point = points[i][j];
//			if (point.fixed) {
//				continue;
//			}
			
//			var tx_ = 1.0, ty_ = 1.0, sx_ = 0.0, sy_ = 0.0;
//			var d_ = point_distance(mouse_x, mouse_y, point.x, point.y);
//			var a_ = point_direction(mouse_x, mouse_y, point.x, point.y);
//			if (d_ < md_) {
//				var dx_ = dcos(a_) * (1 - d_ / md_);
//				var dy_ = -dsin(a_) * (1 - d_ / md_);
//				sx_ = sign(dx_);
//				sy_ = sign(dy_);
//				tx_ = 1.0 - abs(dx_);
//				ty_ = 1.0 - abs(dy_);
//			}
			
//			point.AddDistance(sx_ * animcurve_channel_evaluate(channel_, tx_), sy_ * animcurve_channel_evaluate(channel_, ty_));
//		}
//	}
//}

verlet.Update(delta_time / 1000000);

