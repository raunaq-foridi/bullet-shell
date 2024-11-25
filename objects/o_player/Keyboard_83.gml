/// @description Descent and Water descent
// You can write your code in this editor


if (place_meeting(x,y,o_climbable)){		//begin climb if pressed on ladder
	climbing=true;	
}

if(grounded and not detect_tile(0,1)){		//descend through semi-solids or ladders
	y+=climb_speed;
	}	
	
if(not grounded and water){					//swim downwards
	if(vel_y<swim_speed){vel_y+=swim_acceleration;}	
	dir[1]=1;
}
