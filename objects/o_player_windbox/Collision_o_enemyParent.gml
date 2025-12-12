/// @description Copied from o_Sword

//if (not other.invincible and not waiting){ //invincibility may prevent these connecting. 
//windboxes should be fine without hitboxes.
if (not waiting){
	//other.hp-=1;	//Pogo boxes should NOT deal damage
	
	var _vx = other.vel_x;
	var _vy = other.vel_y;
	
	if(abs(_vx)> abs(wind_x) and sign(_vx)==sign(wind_x)){}
	else{other.vel_x=wind_x;}
	
	if(abs(_vy)> abs(wind_y) and sign(_vy)==sign(wind_y)){}
	else{other.vel_y=wind_y;}
		
	//audio_play_sound(snd_hit,1,false);	//If a wind sound is added, here it shall lie
	
	
}


