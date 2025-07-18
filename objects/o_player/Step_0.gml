/// @description Carries out motion
// You can write your code in this editor
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
		//dirty.
		if(abs(vel_y)<abs(o_platform.mov_y)){
			y+=o_platform.mov_y + bonus_mov_y;
		}
	}
}
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
