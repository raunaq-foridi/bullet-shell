/// @description Insert description here
// You can write your code in this editor

var _speed=1;	//testing purposes

if (moving="down"){
	if (y-start_y<range){
		y+=_speed;
		momentum_y=_speed;
		}
	else{moving="up";}
}

else{
	if (start_y-y<range){
		y-=_speed;
		momentum_y=-_speed;
		}
	else{moving="down";}
}