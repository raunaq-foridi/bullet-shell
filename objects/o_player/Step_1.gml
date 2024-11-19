/// @description Insert description here
// You can write your code in this editor


//Might Bundle Groundedness+Gravity code into a reusable script eventually.
//

if(place_meeting(x,y,layer_tilemap_get_id(layer_get_id("water_tiles")))){water=true;}
else{water=false;}
if(water=true){		//Water Physics Variables
	max_vel=10;
	grav_speed=0.2;
	terminal_speed=5; 
	friction_power=1; 
	air_resistance=0.75;
	slope_max=4;		
}
else{				//Standard Physics Variables
	max_vel=100;
	grav_speed=1; 
	terminal_speed=200; 
	friction_power=1; 
	air_resistance=1; 
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
	var _applied_friction = sign(vel_x) * friction_power;	//linear friction, slows per second.
	if(not grounded){_applied_friction= sign(vel_x) * air_resistance;}
	vel_x -= _applied_friction;
}
else{vel_x=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.


//KEYBOARD CENTRIC CODE. BEWARE.
if(not keyboard_check(ord("W")) and not keyboard_check(ord("S"))){
	dir[1]=0;
}

if(not keyboard_check(ord("A")) and not keyboard_check(ord("D"))){
	dir[0]=0;
}