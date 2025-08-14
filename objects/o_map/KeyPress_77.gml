/// @description Insert description here
// You can write your code in this editor
transparent_map=global.map_transparency;
if (not o_player.occupied){
	visible = not visible;
	o_player.occupied = true;
	o_keyboard_controller.keyboard_pos = current_room;
	if(instance_exists(o_room_info)){o_keyboard_controller.keyboard_pos = [o_room_info.map_x,o_room_info.map_y];}
}
else if (visible){
	visible = not visible;
	o_player.occupied = false;
}