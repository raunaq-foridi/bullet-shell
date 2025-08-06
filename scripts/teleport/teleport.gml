// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function teleport(_destination=room){
	o_player.teleporting=true;
	room_goto(_destination);
}