/// @description Insert description here
// You can write your code in this editor
event_inherited();

depth=300;
function interaction(){
	instance_activate_object(o_inventory_menu);
	if (player_pos!=0){
		o_player.x = player_pos[0]
		o_player.y = player_pos[1]
	}
	room_goto(destination);
}