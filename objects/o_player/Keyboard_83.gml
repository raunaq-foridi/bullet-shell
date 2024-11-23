/// @description Descent and Water descent
// You can write your code in this editor

if(grounded and not detect_tile(0,1)){
	y+=1;}
	
if(not grounded and water){
	if(vel_y<swim_speed){vel_y+=swim_acceleration;}	
	dir[1]=1;
}
