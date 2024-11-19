/// @description Jump/waterdash
// You can write your code in this editor

if(grounded and not water){
	vel_y = -jump_speed;	//negative, because positive is downwards for some weird reason.
}

else if(water and alarm[2]<=0){
	var _mag = sqrt( sqr(dir[0]) + sqr(dir[1]))
	var _dir = [0,0];
	if(_mag!=0){_dir = [dir[0]/_mag, dir[1]/_mag]}
	
	vel_x+=water_dash*_dir[0];
	vel_y+=water_dash*_dir[1];
	
	if(dir[1]=0){		//If not moving vertically, use last horizontal direction to dash
		if(facing="right"){vel_x+=water_dash;}	
		else{vel_x-=water_dash;}
	}
	alarm[2]=dash_cooldown;
}