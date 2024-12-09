/// @description Insert description here
// You can write your code in this editor

//Collision Code
if (place_meeting(x+mov_x+bonus_mov_x*2,y+mov_y+bonus_mov_y*2,o_player)){

	with (o_player){
		x+=other.bonus_mov_x*6;
		repeat_move(other.mov_x,other.mov_y);
		
	}
}

