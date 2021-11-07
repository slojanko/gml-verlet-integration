function Shape() constructor{
	points = undefined;
	connections = undefined;
	unique_id = -1;
	
	static Create = function() {
		show_error("Create not implemented", true);
	}
	
	static Update = function(delta_time_) {
		var points_count = ds_list_size(points);
		var connections_count = ds_list_size(connections);
		
		for(var i = 0; i < points_count; i++) {
			points[| i].Update(delta_time_);
		}

		for(var i = 0; i < connections_count; i++) {
			connections[| i].Update();
		}
	}
	
	static Draw = function() {
		show_error("Draw not implemented", true);
	}
	
	static DrawDebug = function() {
		var points_count = ds_list_size(points);
		var connections_count = ds_list_size(connections);
		
		draw_set_color(c_green);
		for(var i = 0; i < connections_count; i++) {
			connections[| i].DebugDraw();
		}
		
		draw_set_color(c_red);
		for(var i = 0; i < points_count; i++) {
			points[| i].DebugDraw();
		}
		
		draw_set_color(c_white);
	}
}