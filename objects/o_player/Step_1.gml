/// @description Insert description here
// You can write your code in this editor


//Might Bundle Groundedness+Gravity code into a reusable script eventually.
//Groundedness code
if (detect_tile(0,1)!=0){
	grounded=true;
}
else{grounded=false;}

//Deal with Semi Solids		
if(place_meeting(x,y+1,o_semiSolid) and vel_y>=0){
	var _semisolid=instance_place(x,y+1,o_semiSolid);
	var _semisolidList = ds_list_create();
	instance_place_list(x,y+1,o_semiSolid,_semisolidList,true);
	var _semisolid2 = ds_list_find_value(_semisolidList,ds_list_size(_semisolidList)-1);
	if(not place_meeting(x,y,_semisolid2)){
		grounded=true;
	}
	ds_list_destroy(_semisolidList);
}
/*if (place_meeting(x,y+1,o_semiSolid)){
	var _semisolid = instance_place(x,y+1,o_semiSolid);	
	if(place_meeting(x,y,_semisolid)){
		grounded=false;
	}
}*/


/*if (place_meeting(x,y+vel_y,o_semiSolid)){
	var _semisolid = instance_place(x,y,o_semiSolid);
	print(place_meeting(x,y,_semisolid));
	if (not place_meeting(x,y,_semisolid)){
		grounded=true;	//Only set grounded if the semi-solid is beneath you, not in you.
		//print(_semisolid);
	}
	over_semi_solid=true;
	//if (not place_meeting(x,y,o_semiSolid) or true){grounded=true;}
	
}*/

//gravity
if (not grounded){
	if (vel_y<=terminal_speed){
		vel_y+=grav_speed;}
}
else if(vel_y>0){	//i.e, if grounded, set fall speed to 0
	vel_y=0;}

//friction

if (round(vel_x!=0)){
	var _applied_friction = sign(vel_x) * friction_power;	//linear friction, slows per second.
	if(not grounded){_applied_friction= sign(vel_x) * air_resistance;}
	vel_x -= _applied_friction;
}
else{vel_x=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.

