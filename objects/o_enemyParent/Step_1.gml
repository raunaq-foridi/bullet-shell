/// @description Insert description here
// You can write your code in this editor

//Groundedness code
if (detect_tile(0,1)!=0){
	grounded=true;
}
else{grounded=false;}

//gravity
if (not grounded){
	if (vel_y<=terminal_speed){
		vel_y+=grav_speed;}
}
else if(vel_y>0){	//i.e, if grounded, set fall speed to 0
	vel_y=0;}
	
//friction

if (round(vel_x!=0)){
	vel_x -= sign(vel_x)*0.4;	//very basic friction.
}
else{vel_x=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.


movement_ai();	//Runs movement code, if present.