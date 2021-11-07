function Verlet() constructor {
	points = ds_list_create();
	connections = ds_list_create();
	
	static AddPoint = function(x_, y_, tx_ = 0, ty_ = 0, fixed_ = false) {
		ds_list_add(points, new Point(x_, y_, tx_, ty_, fixed_));
	}
	
	static RemovePoint = function(p_) {
		ds_list_delete_condition(points, method({p : p_}, function(el) { return el == p; }));
		RemoveConnectionAny(p_);
	}
	
	static AddConnection = function(p1_, p2_) {
		ds_list_add(connections, new Connection(p1_, p2_));
	} 
	
	// TODO: Try to find a better way of passing in values to check for
	static RemoveConnection = function(p1_, p2_) {
		ds_list_delete_condition(connections, method({p1 : p1_, p2 : p2_}, function(el) { return (el.p1 == p1 && el.p2 == p2) || (el.p1 == p2 && el.p2 == p1); }));
	}
	
	static RemoveConnectionAny = function(p_) {
		ds_list_delete_condition(connections, method({p : p_}, function(el) { return el.p1 == p || el.p2 == p; }));
	}
	
	static AddRect = function(x1_, y1_, x2_, y2_, num_x_, num_y_) {
		ds_list_clear(points);
		ds_list_clear(connections);
		
		var x_step_ = (x2_ - x1_) / (num_x_ - 1);
		var y_step_ = (y2_ - y1_) / (num_y_ - 1);
		
		for(var yy = 0; yy < num_y_; yy++) {
			for(var xx = 0; xx < num_x_; xx++) {
				ds_list_add(points, new Point(x1_ + xx * x_step_, y1_ + yy * y_step_, xx / (num_x_ - 1), yy / (num_y_ - 1), false));
			}
		}
		
		for(var xx = 0; xx < num_x_; xx++) {
			for(var yy = 0; yy < num_y_; yy++) {
				var index = yy * num_x_ + xx;
				if (yy < num_y_ - 1) {
					ds_list_add(connections, new Connection(points[| index], points[| index + num_x_]));
				}
			
				if (xx < num_x_ - 1) {
					ds_list_add(connections, new Connection(points[| index], points[| index + 1]));
				}
		
				if (xx < num_x_ - 1 && yy < num_y_ - 1) {
					ds_list_add(connections, new Connection(points[| index], points[| index + num_x_ + 1]));
				}
				
				if (xx > 0 && yy < num_y_ - 1) {
					ds_list_add(connections, new Connection(points[| index], points[| index + num_x_ - 1]));
				}
			}
		}
		
		points[| 0].fixed = true;
		points[| num_x_ - 1].fixed = true;
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
	
	static DrawRect = function() {
		draw_primitive_begin_texture(pr_trianglelist, sprite_get_texture(spr_pepe, 0));
		
		for(var i = 0; i < 11; i++) {
			for(var j = 0; j < 11; j++) {
				var index = j * 12 + i;
				
				draw_vertex_texture(points[| index].x, points[| index].y, points[| index].tx, points[| index].ty);
				draw_vertex_texture(points[| index + 1].x, points[| index + 1].y, points[| index + 1].tx, points[| index + 1].ty);
				draw_vertex_texture(points[| index + 12 + 1].x, points[| index + 12 + 1].y, points[| index + 12 + 1].tx, points[| index + 12 + 1].ty);
				
				draw_vertex_texture(points[| index + 12 + 1].x, points[| index + 12 + 1].y, points[| index + 12 + 1].tx, points[| index + 12 + 1].ty);
				draw_vertex_texture(points[| index + 12].x, points[| index + 12].y, points[| index + 12].tx, points[| index + 12].ty);
				draw_vertex_texture(points[| index].x, points[| index].y, points[| index].tx, points[| index].ty);
			}
		}

		draw_primitive_end();
	}
	
	static DebugDraw = function() {
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