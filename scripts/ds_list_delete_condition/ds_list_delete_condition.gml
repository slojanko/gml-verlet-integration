function ds_list_delete_condition(list, condition) {
	var count = ds_list_size(list);
	for(var i = 0; i < count; i++) {
		if (condition(list[| i])) {
			ds_list_delete(list, i);
			i--;
			count--;
		}
	}
}