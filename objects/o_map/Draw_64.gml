/// @description Insert description here
// You can write your code in this editor

//iterate over the visited_rooms ds_grid

for(var _y=0;_y<map_height;_y++){
for(var _x=0;_x<map_width;_x++){

	
	draw_sprite(s_map_cell,visited_rooms[# _x,_y],x_pos + _x*cell_size,y_pos + _y*cell_size);
}
}