/// @description Insert description here
// You can write your code in this editor
transparent_map=global.map_transparency;
if (not o_player.occupied){
	visible = not visible;
	o_player.occupied = true;
}
else if (visible){
	visible = not visible;
	o_player.occupied = false;
}