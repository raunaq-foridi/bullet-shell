/// @description Descent and Water descent
// You can write your code in this editor
if(occupied){exit}		//pause controls if in dialogue

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
