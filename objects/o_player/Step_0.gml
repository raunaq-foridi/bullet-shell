/// @description Carries out motion
// You can write your code in this editor
//platforms
if(place_meeting(x,y+1,o_platform)){
	if(abs(vel_x)<abs(o_platform.mov_x)){x+=o_platform.mov_x+o_platform.bonus_mov_x;}	//dirty.
	if(abs(vel_y)<abs(o_platform.mov_y)){y+=o_platform.mov_x+o_platform.bonus_mov_x;}
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
