/// @description Jump/waterdash
// You can write your code in this editor
print(equipment);
if(occupied){exit}		//pause controls if in dialogue

if(grounded and not water){
	vel_y = -jump_speed;	//negative, because positive is downwards for some weird reason.
	
	//platform momentum
	if(place_meeting(x,y+1,o_platform)){ // and (abs(x-o_platform.x)<o_platform.clamp_x)
		
		var _platform = furthest_instance(o_platform);
		if not(place_meeting(x,y,_platform)){	//ignore error. this works.
			vel_x+= _platform.momentum_x;
		}
	}         
}

else if(water and alarm[2]<=0){
	var _mag = sqrt( sqr(dir[0]) + sqr(dir[1]))
	var _dir = [0,0];
	if(_mag!=0){_dir = [dir[0]/_mag, dir[1]/_mag]}
	
	dashing=true;
	dash_dir=_dir;
	if(not alternate_dash){
		vel_x+=water_dash*_dir[0];
		vel_y+=water_dash*_dir[1];
	
		if(dir[1]=0){		//If not moving vertically, use last horizontal direction to dash
			if(facing="right"){vel_x+=water_dash;}	
			else{vel_x-=water_dash;}
		}
	}
	alarm[2]=dash_cooldown;
}

if(climbing){climbing=false;}	//stop climbing if you jump