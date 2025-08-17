/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(o_player)<radius){
	within_range = true;
	if(not array_contains(o_player.interactions,id)){
		//o_player.interactions
		array_push(o_player.interactions,id);
	}
}
else{
	within_range = false;
	if(array_contains(o_player.interactions,id)){
		//o_player.interactions
		var _index = array_get_index(o_player.interactions,id);
		array_delete(o_player.interactions,_index,1);
		
	}
}
if(array_length(o_player.interactions)>0){
	if(o_player.interactions[0]==id){closest = true;}
	else{closest=false;}
}
else{closest=false;}

if (keyboard_check_pressed(global.keys.select)){
	alarm[0]=1;	
}