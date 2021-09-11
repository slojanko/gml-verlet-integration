show_debug_overlay(true);
profiler = new Profiler();

x_offset = 320;
y_offset = 120;

height = 12;
width = 12; 
spacing = 35;

points = 0;
connections = array_create((width - 1) * height + (height - 1) * width + (width - 1) * (height - 1)); // 3wh - 2h - 2w + 1

// Prepare arrays
for(var i = 0; i < height; i++) {
	points[i][width - 1] = 0;
}

var xx, yy;
for(var i = 0; i < height; i++) {
	for(var j = 0; j < width; j++) {
		xx = x_offset + j * spacing;
		yy = y_offset + i * spacing;
		points[i][j] = new Point(xx, yy, j / (width - 1), i / (height - 1));
	}
}

points[0][0].fixed = true;
points[0][width/2].fixed = true;
points[0][width-1].fixed = true;

var index = 0;
for(var i = 0; i < height; i++) {
	for(var j = 0; j < width; j++) {
		if (i < height - 1) {
			connections[index++] = new Connection(points[i][j], points[i+1][j]);
		}
			
		if (j < width - 1) {
			connections[index++] = new Connection(points[i][j], points[i][j+1]);
		}
		
		if (j > 0 && i < height - 1) {
			connections[index++] = new Connection(points[i][j], points[i+1][j-1]);
		}
	}
}