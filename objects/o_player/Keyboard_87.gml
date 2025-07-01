/// @description Water + Climbing.
if(occupied){exit}		//pause controls if in dialogue

if (place_meeting(x,y,o_climbable)){		//begin climb if pressed on ladder
	climbing=true;	
}

if(water and -vel_y<=swim_speed and alarm[3]<=0){
	vel_y-=swim_acceleration;	
	dir[1]=-1;
}
if(climbing and not detect_tile(0,-1)){								//ascend ladder.
	//y-=climb_speed;
	repeat_move(0,-climb_speed);
	if(climbing and climbable and not climbable.lock_y){	//ignore code if Locked.
		if(climbable.y-y < climbable.clamp_y or climbable.clamp_y<0){
			repeat_move(0,climbable.momentum_y);
		}
}
}