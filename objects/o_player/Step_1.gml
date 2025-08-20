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
	if(flying){vel_x=0;}
	flying=false;
	falling=false
	alarm[5]=-1;
}
else{
	if(grounded){alarm[5]=2;}
	grounded=false;
	//print("gwowo");
	//print(alarm[5]);
	//alarm[5]=2;
}
if (not flying){fly_speed=0;}

//Deal with Semi Solids		
//See repeat_move() code
if(place_meeting(x,y+1,o_semiSolid) and vel_y>=0){
	var _semisolid = furthest_instance(o_semiSolid);
	if(not place_meeting(x,y,_semisolid)){
		grounded=true;		//if at foot but NOT intersecting player, set grounded.
		falling=false;
		flying=false;
	}

}
//Deal with climbing
if(climbing){
	if (not place_meeting(x,y,o_climbable)){
		climbing=false;
		
	}
	else{
		grounded=true;
		vel_y=0;
		flying=false;
		falling=false;
		//Deal with moving climbables
		
		var _climbable = nearest_instance(o_climbable,0,0,0);
		//print(_climbable);
		
		if (input_check("move_up") or input_check("move_down") or input_check("move_left") or input_check("move_right")){
											//Change which climbable surface is latched onto only on input
			if(climbable!=_climbable){		//if nothing is latched onto, latch on and set relative distances
				climbable=_climbable;
				climbable.rel_x=x-climbable.x;
				climbable.rel_y=y-climbable.y;
			}

			else{
				if(input_check("move_left") and not climbable.lock_x){
					climbable=_climbable;
					if(climbable.x-x < climbable.clamp_x or climbable.clamp_x<0){
						climbable.rel_x=x-climbable.x;		//allows movement if not locked, and not beyond clamp range.
					}
				}
				else if(input_check("move_right") and not climbable.lock_x){
					if(x-climbable.x<climbable.clamp_x or climbable.clamp_x<0){
						climbable.rel_x=x-climbable.x;	//Likewise
					}
				}
			
				if (input_check("move_up") and not climbable.lock_y){		//this allows lock_y to work
					climbable=_climbable;			//for the same reason.
					if(climbable.y-y<climbable.clamp_y or climbable.clamp_y<0){
						climbable.rel_y=y-climbable.y;
					}
				}
				else if (input_check("move_down") and not climbable.lock_y){		//this allows lock_y to work
					climbable=_climbable;			//for the same reason.
					if(y-climbable.y<climbable.clamp_y or climbable.clamp_y<0){
						climbable.rel_y=y-climbable.y;
					}
				}
			}

		}
		//ERROR HERE	
		if(instance_exists(climbable) and climbable!=0){
			print(climbable);
			if (climbable.snap_x){
				x=climbable.x+climbable.rel_x;	//"snap" to climbable, with a relative distance.
			}									//allows you to stay on a moving platform
			if (climbable.snap_y){
				y=climbable.y+climbable.rel_y;
			}
			if (climbable.lock_x){				//This code is useless.
				vel_x=0;
			}
		}
		/*with(climbable){
			if (variable_instance_exists(id,snap_x)){
				if(snap_x){other.x = x+rel_x}
				if(snap_y){other.y = y+rel_y}
				if(lock_x){vel_x=0}
			}
			
		}*/
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

if (round(vel_x)!=0 and abs(vel_x)>abs(fly_speed)){
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
else if (not flying){vel_x=0;}	//cuts off any speed <0.5; probably good for performance, stops oscillation.
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

//deal with teleporting
if(teleporting and instance_exists(o_checkpoint)){
	x = o_checkpoint.x;
	y = o_checkpoint.y-50;

}

//KEYBOARD CENTRIC CODE. BEWARE.
//BEING FIXED. AM AWARE.
if(not input_check("move_up") and not input_check("move_down")){
	dir[1]=0;
}

if(not input_check("move_left") and not input_check("move_right")){
	dir[0]=0;
}

teleporting=false;