
//Functions for standard physics code. Gravity, friction etc

function basic_gravity(){
	//groundedness
	if (detect_tile(0,1)!=0){
		grounded=true;
	}
	else{grounded=false;}

	//gravity
	if (not grounded){
		if (vel_y<terminal_speed){
			vel_y+=grav_speed;}
	}
	else if(vel_y>0){	//i.e, if grounded, set fall speed to 0
		vel_y=0;}
}

function basic_friction( _intensity){
	//from 0 to 1, how fast to kill horizontal speed.
	if (round(vel_x!=0)){
		vel_x -= sign(vel_x)*_intensity;	//very basic friction.
	}
	else{vel_x=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.

	
}