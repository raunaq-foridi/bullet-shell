/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Movement code
var _speed=3;
bonus_mov_y=0;
if (moving="down"){
	if (y-start_y<range){
		mov_y=_speed;
		//momentum_y=_speed;//*1.95;
	}
	else{
		moving="up";
		bonus_mov_y=-_speed;
	}
}

else{
	if (start_y-y<range){
		mov_y=-_speed;
		//momentum_x=-_speed;//*1.95;
		}
	else{
		moving="down";
		bonus_mov_y=_speed;
	}
}

if (place_meeting(x,y-o_player.vel_y-1,o_player)){	//move the player with the platform
	if(not place_meeting(x,y,o_player)){		//No-clipping behaviour.
		o_player.y+=mov_y						
		//avoid clipping through level design.
		with(o_player){
			if(detect_tile_objectless(0,0)){y-=other.mov_y;}	
		}
	}
}
y+=mov_y;
