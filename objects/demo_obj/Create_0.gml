show_debug_overlay(true);
profiler = new Profiler();

verlet = new Verlet();
var shape = verlet.AddShape(new Rectangle(100, 100, 50, 50, 3, 3));
verlet.AddShape(new Rectangle(200, 100, 100, 100, 6, 6));
verlet.AddShape(new Rectangle(400, 100, 200, 200, 6, 6));
verlet.AddShape(new Rectangle(700, 100, 300, 300, 12, 12));

verlet.DeleteShape(shape);