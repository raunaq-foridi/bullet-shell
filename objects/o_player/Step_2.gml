/// @description Visuals and resets


if (invincible){
	visible=blink;
}
else{visible=true;}

//checking for Slopes

if(grounded){
	
	//Sloping Upwards
	if(detect_tile(sign(vel_x),0)){		//check for a tile directly in front of player
		
		var _dy=up_slope();				//find how steep a slope
		if (_dy<=slope_max){vel_y-=_dy;}//if slope detected, add vertical speed to scale it
										//if "too steep", treat as a wall instead and do nothing
	}
	
	if(detect_tile(-sign(vel_x),0)){	//check for tile directly behind player
		var _dy = down_slope();
		if (_dy<=slope_max){vel_y+=_dy}	//shove player down while moving down slope
	}
	
		
}
if(not climbing){climbable=false;}

array_sort(interactions,sort_distance);	//order the interactable objects by distance, so only the nearest is interacted with