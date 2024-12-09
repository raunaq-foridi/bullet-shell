/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//Movement code
var _speed=2;
bonus_mov_x=0;
if (moving="right"){
	if (x-start_x<range){
		x+=_speed;
		mov_x=_speed;
		momentum_x=_speed*1.95;
	}
	else{
		moving="left";
		bonus_mov_x=-_speed;
	}
}

else{
	if (start_x-x<range){
		x-=_speed;
		mov_x=-_speed;
		momentum_x=-_speed*1.95;
		}
	else{
		moving="right";
		bonus_mov_x=_speed;
	}
}

