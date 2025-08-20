/// @description Insert description here
// You can write your code in this editor

x_pos = 300;
y_pos = 100;

map_start_x = 0;
map_start_y = 0;
cell_size=50;

transparent_map=global.map_transparency;
//Use these variables to adjust the map. Errors will happen if the map is too small.
map_width=15;
map_height=10;
visited_rooms = ds_grid_create(global.world_map_width,global.world_map_height);	//0 = unvisited, 1 = visited, 2 = current

current_room = [0,0]
visible=false;

//Map capabilities

teleportation = true;
