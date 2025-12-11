/// @description Copied from o_Sword

//if (not other.invincible and not waiting){ //invincibility may prevent these connecting. 
//Never have a pogobox without some corresponding hitbox
if (not waiting){
	//other.hp-=1;	//Pogo boxes should NOT deal damage
	
	var _vx = o_player.vel_x;
	var _vy = o_player.vel_y;
	
	if(abs(_vx)> abs(pogo_x) and sign(_vx)==sign(pogo_x)){}
	else{o_player.vel_x=pogo_x;}
	
	if(abs(_vy)> abs(pogo_y) and sign(_vy)==sign(pogo_y)){}
	else{o_player.vel_y=pogo_y;}
		
	//audio_play_sound(snd_hit,1,false);	//If a pogo sound is added, here it shall lie
	
	
}


