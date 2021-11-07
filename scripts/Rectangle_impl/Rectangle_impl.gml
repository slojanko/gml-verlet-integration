function Rectangle(x_, y_, width_, height_, num_x_, num_y_) : Shape() constructor {
	points = ds_list_create();
	connections = ds_list_create();
	num_x = num_x_;
	num_y = num_y_;
	
	Create(x_, y_, width_, height_, num_x_, num_y_);
	
	static Create = function(x_, y_, width_, height_, num_x_, num_y_) {
		var x_step_ = width_ / (num_x_ - 1);
		var y_step_ = height_ / (num_y_ - 1);
		
		for(var yy = 0; yy < num_y_; yy++) {
			for(var xx = 0; xx < num_x_; xx++) {
				ds_list_add(points, new Point(x_ + xx * x_step_, y_ + yy * y_step_, xx / (num_x_ - 1), yy / (num_y_ - 1), false));
			}
		}
		
		for(var yy = 0; yy < num_y_; yy++) {
			for(var xx = 0; xx < num_x_; xx++) {
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
	
	static Draw = function() {
		draw_primitive_begin_texture(pr_trianglelist, sprite_get_texture(spr_pepe, 0));
		
		var xx = num_x - 1;
		var yy = num_y - 1;
		for(var i = 0; i < xx; i++) {
			for(var j = 0; j < yy; j++) {
				var index = j * num_x + i;
				
				draw_vertex_texture(points[| index].x, points[| index].y, points[| index].tx, points[| index].ty);
				draw_vertex_texture(points[| index + 1].x, points[| index + 1].y, points[| index + 1].tx, points[| index + 1].ty);
				draw_vertex_texture(points[| index + num_x + 1].x, points[| index + num_x + 1].y, points[| index + num_x + 1].tx, points[| index + num_x + 1].ty);
				
				draw_vertex_texture(points[| index + num_x + 1].x, points[| index + num_x + 1].y, points[| index + num_x + 1].tx, points[| index + num_x + 1].ty);
				draw_vertex_texture(points[| index + num_x].x, points[| index + num_x].y, points[| index + num_x].tx, points[| index + num_x].ty);
				draw_vertex_texture(points[| index].x, points[| index].y, points[| index].tx, points[| index].ty);
			}
		}

		draw_primitive_end();
	}
}