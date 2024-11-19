/// @description Carries out motion
// You can write your code in this editor

if(alternate_dash){

		if (alarm[2]>=50 and dashing){
			
			if(dash_dir[1]=0){
				if(facing="right"){dash_dir[0]=1;}
				else{dash_dir[0]=-1;}
			}
			vel_x=water_dash*dash_dir[0]*1.3;
			vel_y=water_dash*dash_dir[1]*1.3;
		}
		
	}
	
repeat_move(vel_x,vel_y);
print(vel_x, vel_y, grounded);
