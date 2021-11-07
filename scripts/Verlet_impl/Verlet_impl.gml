function Verlet() constructor {
	shapes = ds_list_create();
	unique_id = -1;
	
	static AddShape = function(shape_) {
		unique_id++;
		shape_.unique_id = unique_id;
		ds_list_add(shapes, shape_);
		return unique_id;
	}
	
	static DeleteShape = function(unique_id_) {
		ds_list_delete_condition(shapes, method({unique_id : unique_id_}, function(shape) { return shape.unique_id == unique_id; }))
	}
	
	static Update = function(delta_time_) {
		var shapes_count = ds_list_size(shapes);
		for(var i = 0; i < shapes_count; i++) {
			shapes[| i].Update(delta_time_);
		}
	}
	
	static Draw = function() {
		var shapes_count = ds_list_size(shapes);
		for(var i = 0; i < shapes_count; i++) {
			shapes[| i].Draw();
		}
	}
}