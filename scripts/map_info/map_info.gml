//"Script" for holding variables for the map

world_map_width=15;
world_map_height=10;
//Store any rooms which are at all notable - names, qualities, features on map etc
global.room_info = ds_grid_create(world_map_width,world_map_height);

//For reference:
/*
global.room_info[# map_x, map_y] = {
	tooltip,
	name,
	checkpoint,
	savepoint,
	icon,
	room,
}
*/
//Is the structure of room info
//Data is saved in the o_room_info object