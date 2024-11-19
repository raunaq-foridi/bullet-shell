/// @description Vertical water movement

if(water and -vel_y<=swim_speed and alarm[3]<=0){
	vel_y-=swim_acceleration;	
}
dir[1]=-1;