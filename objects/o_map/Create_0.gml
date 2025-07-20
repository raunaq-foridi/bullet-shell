/// @description Insert description here
// You can write your code in this editor

x_pos = 100;
y_pos = 100;

cell_size=16;

//Use these variables to adjust the map. Errors will happen if the map is too small.
map_width=10;
map_height=10;
visited_rooms = ds_grid_create(map_width,map_height);	//0 = unvisited, 1 = visited, 2 = current