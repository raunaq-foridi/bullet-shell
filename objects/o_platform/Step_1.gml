/// @description Insert description here
// You can write your code in this editor

//Collision Code
if (place_meeting(x+mov_x+bonus_mov_x*2,y,o_player)){
	//print(string(bonus_mov_x)+"B");
	//Deprecated code. Kept for reference.
	
	//This code will act only if the player is moving into/slower than the platform
	/*if(sign(o_player.vel_x)==sign(mov_x) or o_player.vel_x==0){
		with (o_player){
			if(not detect_tile(sign(other.mov_x),0)){
				x+=sign(other.mov_x);
			}
			repeat_move(other.mov_x-sign(other.mov_x),other.mov_y);
		}
		print("B");
	}
	else{
		o_player.x+=mov_x;
		o_player.y+=mov_y;
		print("A");
	}*/
	
	with (o_player){
		x+=other.bonus_mov_x*6;
		//print(string(other.bonus_mov_x) + "a");
		repeat_move(other.mov_x,other.mov_y);
		
	}
}

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
