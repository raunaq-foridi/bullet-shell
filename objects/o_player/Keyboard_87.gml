/// @description Vertical water movement

if(water and -vel_y<=swim_speed){
	vel_y-=swim_acceleration;	
}
dir[1]=-1;