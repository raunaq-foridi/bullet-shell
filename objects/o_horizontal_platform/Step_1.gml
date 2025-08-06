/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//If there is an associated lever,link movement to it
if(controller_tag!=""){
	with(o_lever){
		if(tag!=other.controller_tag){continue}
		//require ALL associated levers to be on ["AND gate"]
		if(not activated){
			other.active=false;
			exit
			}
	}
}
active=true;
//Movement code
var _speed=7;
bonus_mov_x=0;
if (moving="right"){
	if (x-start_x<range){
		x+=_speed;
		mov_x=_speed;
		momentum_x=_speed;//*1.95;
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
		momentum_x=-_speed;//*1.95;
		}
	else{
		moving="right";
		bonus_mov_x=_speed;
	}
}

