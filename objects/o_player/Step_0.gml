/// @description Carries out motion
// You can write your code in this editor


//	Controls. Assumes Keyboard, later change to support Controllers.
if (not occupied){
//----------------------------------------------------------------------------------------//

//Jumping

if (keyboard_check_pressed(global.keys.jump)){
	if(grounded and not water){
		vel_y = -jump_speed;	//negative, because positive is downwards for some weird reason.
	
		//platform momentum
		if(place_meeting(x,y+1,o_platform)){ // and (abs(x-o_platform.x)<o_platform.clamp_x)
		
			var _platform = furthest_instance(o_platform);
			if (not place_meeting(x,y,_platform) and _platform.active){	//ignore error. this works.
				vel_x+= _platform.momentum_x;
			}
		}         
	}

	else if(water and alarm[2]<=0){
		var _mag = sqrt( sqr(dir[0]) + sqr(dir[1]))
		var _dir = [0,0];
		if(_mag!=0){_dir = [dir[0]/_mag, dir[1]/_mag]}
	
		dashing=true;
		dash_dir=_dir;
		if(not alternate_dash){
			vel_x+=water_dash*_dir[0];
			vel_y+=water_dash*_dir[1];
	
			if(dir[1]=0){		//If not moving vertically, use last horizontal direction to dash
				if(facing="right"){vel_x+=water_dash;}	
				else{vel_x-=water_dash;}
			}
		}
		alarm[2]=dash_cooldown;
	}

	if(climbing){climbing=false;}	//stop climbing if you jump
}

//Left

if (keyboard_check(global.keys.move_left)){
	facing="left";
	//climbing code
	if(climbing and climbable and not climbable.lock_x){	//ignore code if Locked.
		if(climbable.x-x < climbable.clamp_x or climbable.clamp_x<0){
			repeat_move(-climb_speed+climbable.momentum_x,0);
		}
	}
	//regular movement
	else{
		if(-vel_x<=move_speed){
			vel_x=-move_speed;
			if(flying){flying=false;}
		}
		dir[0]=-1;
	}	
}

//Right

if (keyboard_check(global.keys.move_right)){
	
	facing="right";
	//climbing code
	if(climbing and climbable and not climbable.lock_x){	//ignore code if Locked.
		if(x-climbable.x < climbable.clamp_x or climbable.clamp_x<0){
			repeat_move(climb_speed+climbable.momentum_x,0);
		}
	}
	//regular movement
	else{
		if(vel_x<=move_speed){
			vel_x=move_speed;
			if(flying){flying=false;}
		}
		dir[0]=1;
}
}

//Up

if (keyboard_check(global.keys.move_up)){
	
	if (place_meeting(x,y,o_climbable)){		//begin climb if pressed on ladder
		climbing=true;	
	}

	if(water and -vel_y<=swim_speed and alarm[3]<=0){
		vel_y-=swim_acceleration;	
		dir[1]=-1;
	}
	if(climbing and not detect_tile(0,-1)){								//ascend ladder.
		//y-=climb_speed;
		repeat_move(0,-climb_speed);
		if(climbing and climbable and not climbable.lock_y){	//ignore code if Locked.
			if(climbable.y-y < climbable.clamp_y or climbable.clamp_y<0){
				repeat_move(0,climbable.momentum_y);
			}
	}
	}

}

//Down

if (keyboard_check(global.keys.move_down)){

	if (place_meeting(x,y,o_climbable)){		//begin climb if pressed on ladder
		climbing=true;	
	}

	if(grounded and not detect_tile(0,1)){		//descend through semi-solids or ladders
		var _semiSolid = furthest_instance(o_semiSolid);
		if(not _semiSolid or _semiSolid.descendable){
			y+=climb_speed;
		}
		//climbing
		if(climbing and climbable and not climbable.lock_y){	//ignore code if Locked.
			if(y-climbable.y < climbable.clamp_y or climbable.clamp_y<0){
				repeat_move(0,climbable.momentum_y);
		}
	}
		}	
	
	if(not grounded and water){					//swim downwards
		if(vel_y<swim_speed){vel_y+=swim_acceleration;}	
		dir[1]=1;
	}
}
//----------------------------------------------------------------------------------------//
}

//platforms
if(place_meeting(x,y+1,o_platform) and not place_meeting(x,y,o_solid_platform)){
	
	var _platform =furthest_instance(o_platform);
	
	if (_platform.active == true){
		if(not place_meeting(x,y,_platform)){	//Dont set flying in semi-solids or while clipped
			flying=true;
			fly_speed=_platform.mov_x;
		}
	
		if(abs(vel_x)<=abs(_platform.mov_x)){

			if(_platform.object_index != o_semiSolid){
				x+=_platform.bonus_mov_x;
				//y+=_platform.bonus_mov_y;
			}
			//moving, clamped
			//note that when clamped, the player will return to the clamped area automatically
			//if they leave it. This is intentional behaviour
			//clamp_x should be set to a large value to prevent this being noticeable, or zero.
		
		
			if ((sign(x-_platform.x)!=sign(_platform.mov_x) //if moving in opposite direction to player
			or abs(x-_platform.x)<_platform.clamp_x or vel_x!=0 or _platform.clamp_x==0)	//or within clamp region
			and not place_meeting(x,y,_platform)){ //ignore the error. this works.			//not clipped in
				repeat_move(_platform.mov_x,0);
			}
		}

	}
}
//Water dashes
if(alternate_dash){

		if (alarm[2]>=dash_cooldown-dash_time and dashing and water){
			
			if(dash_dir[1]=0){
				if(facing="right"){dash_dir[0]=1;}
				else{dash_dir[0]=-1;}
			}
			vel_x=water_dash*dash_dir[0]*1.3;
			vel_y=water_dash*dash_dir[1]*1.3;
		}
		
	}
	
repeat_move(vel_x,vel_y);
//print(vel_x, vel_y, grounded);
