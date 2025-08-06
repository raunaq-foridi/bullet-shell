/// @description Insert description here
// You can write your code in this editor
//update map
if (instance_exists(o_room_info)){
	var _map_x = o_room_info.map_x;
	var _map_y = o_room_info.map_y;
	
	visited_rooms[# _map_x,_map_y] = 2;
}