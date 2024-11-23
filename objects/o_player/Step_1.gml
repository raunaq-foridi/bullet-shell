/// @description Insert description here
// You can write your code in this editor


//Might Bundle Groundedness+Gravity code into a reusable script eventually.
//

if(place_meeting(x,y,layer_tilemap_get_id(layer_get_id("water_tiles")))){water=true;}
else{water=false;}
if(water=true){		//Water Physics Variables
	max_vel=10;
	grav_speed=0.15;
	terminal_speed=5; 
	friction_power=1; 
	air_resistance=0.1;
	linear_drag=0;
	quadratic_drag=0.01;
	slope_max=4;		
}
else{				//Standard Physics Variables
	max_vel=100;
	grav_speed=1; 
	terminal_speed=200; 
	friction_power=1; 
	air_resistance=1;
	linear_drag=0;
	quadratic_drag=0;
	slope_max=4;
	
	alarm[3]=swim_cooldown;
}

//Groundedness code
if (detect_tile(0,1)!=0){
	grounded=true;
}
else{grounded=false;}


//Deal with Semi Solids		
//See repeat_move() code
if(place_meeting(x,y+1,o_semiSolid) and vel_y>=0){
	var _semisolidList = ds_list_create();
	instance_place_list(x,y+1,o_semiSolid,_semisolidList,true); //ordered list of objects intersecting one pixel below
	var _semisolid = ds_list_find_value(_semisolidList,ds_list_size(_semisolidList)-1);	//take most distant object
	if(not place_meeting(x,y,_semisolid)){
		grounded=true;		//if at foot but NOT intersecting player, set grounded.
	}
	ds_list_destroy(_semisolidList);	//memory purposes
}

//Deal with climbing
if(climbing){
	if (not place_meeting(x,y,o_climbable)){
		climbing=false;
		
	}
	else{
		grounded=true;
		vel_y=0;
		//Deal with moving climbables
		var _climbableList = ds_list_create();
		instance_place_list(x,y,o_climbable,_climbableList,true); //ordered list of objects being climbed
		var _climbable = ds_list_find_value(_climbableList,0);	//take most distant object
		ds_list_destroy(_climbableList);
		print(_climbable);
		if (_climbable.snap){
			x=_climbable.x;
		}
		if (_climbable.lock){
			vel_x=0;
		}
	}
}


//gravity
if (not grounded){
	if (vel_y<=terminal_speed){
		vel_y+=grav_speed;}
	else if(water){
		vel_y-=water_drag;}
}
else if(vel_y>0){	//i.e, if grounded, set fall speed to 0
	vel_y=0;}


//friction
var _speed = sqrt(sqr(vel_x)+sqr(vel_y));
if(_speed>max_vel){
	vel_x*= max_vel/_speed;
	vel_y*= max_vel/_speed;
}

if (round(vel_x)!=0){
	var _applied_friction = sign(vel_x) * friction_power;	//constant friction, slows per second.
	if(not grounded){
		_applied_friction= sign(vel_x) * air_resistance;	//constant
		_applied_friction += vel_x * linear_drag;			//linear
		_applied_friction += sign(vel_x) * sqr(vel_x) * quadratic_drag;	//quadratic
		}
	if(abs(_applied_friction)<=abs(vel_x)){		//Prevent oscillation
		vel_x -= _applied_friction;
	}
	else{
		vel_x=0;
	}
}
else{vel_x=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.
/*if (round(vel_y)!=0){
	var _applied_friction = 0;
	if(not grounded){
		//_applied_friction= sign(vel_y) * air_resistance;	//constant not applied
		_applied_friction += vel_y * linear_drag;			//linear
		//_applied_friction += sign(vel_y) * sqr(vel_y) * quadratic_drag;	//quadratic
		//Uncomment if using Zero Grav
		}
	if(abs(_applied_friction)<=abs(vel_y)){		//Prevent oscillation
		vel_y -= _applied_friction;
	}
	else{
		vel_y=0;
	}
}
else{vel_y=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.
*/



//KEYBOARD CENTRIC CODE. BEWARE.
if(not keyboard_check(ord("W")) and not keyboard_check(ord("S"))){
	dir[1]=0;
}

if(not keyboard_check(ord("A")) and not keyboard_check(ord("D"))){
	dir[0]=0;
}