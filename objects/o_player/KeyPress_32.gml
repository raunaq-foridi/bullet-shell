/// @description Jump/waterdash
// You can write your code in this editor

if(grounded and not water){
	vel_y = -jump_speed;	//negative, because positive is downwards for some weird reason.
}

else if(water and alarm[2]<=0){
	if(facing="right"){vel_x+=water_dash;}
	else{vel_x-=water_dash;}
	alarm[2]=dash_cooldown;
}