/// @description Insert description here
// You can write your code in this editor

var _speed=2;

if (moving="right"){
	if (x-start_x<range){
		x+=_speed;
		momentum_x=_speed;
	}
	else{moving="left";}
}

else{
	if (start_x-x<range){
		x-=_speed;
		momentum_x=-_speed;
		}
	else{moving="right";}
}	