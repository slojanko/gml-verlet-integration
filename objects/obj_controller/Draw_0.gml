draw_primitive_begin_texture(pr_trianglelist, sprite_get_texture(spr_pepe, 0));

for(var i = 0; i < height - 1; i++) {
	for(var j = 0; j < width - 1; j++) {
		draw_vertex_texture(points[i][j].x, points[i][j].y, points[i][j].tx, points[i][j].ty);
		draw_vertex_texture(points[i][j+1].x, points[i][j+1].y, points[i][j+1].tx, points[i][j+1].ty);
		draw_vertex_texture(points[i+1][j].x, points[i+1][j].y, points[i+1][j].tx, points[i+1][j].ty);
		
		draw_vertex_texture(points[i][j+1].x, points[i][j+1].y, points[i][j+1].tx, points[i][j+1].ty);
		draw_vertex_texture(points[i+1][j+1].x, points[i+1][j+1].y, points[i+1][j+1].tx, points[i+1][j+1].ty);
		draw_vertex_texture(points[i+1][j].x, points[i+1][j].y, points[i+1][j].tx, points[i+1][j].ty);
	
		// points[i][j].Draw();
	}
}

draw_primitive_end();

draw_text(0, 24, profiler);