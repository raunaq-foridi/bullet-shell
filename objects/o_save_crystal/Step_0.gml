/// @description Insert description here
// You can write your code in this editor
event_inherited();
timer+=1.5;
timer=timer mod 360;
if (distance_to_object(o_player)<30){
	o_player.recent_savepoint=room;	
}