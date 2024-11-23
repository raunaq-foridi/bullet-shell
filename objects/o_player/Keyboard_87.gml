/// @description Water + Climbing.

if (place_meeting(x,y,o_climbable)){		//begin climb if pressed on ladder
	climbing=true;	
}

if(water and -vel_y<=swim_speed and alarm[3]<=0){
	vel_y-=swim_acceleration;	
	dir[1]=-1;
}
if(climbing){								//ascend ladder.
	y-=climb_speed;	
}