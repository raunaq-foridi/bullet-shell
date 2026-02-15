/// @description Insert description here
// You can write your code in this editor

var _enemy = other.master;

if (not _enemy.invincible and not waiting){
	_enemy.hp-=1;
	//print(_enemy.hp);
	
	_enemy.invincible=true;	//makes enemy invulnerable
	_enemy.stunned=stun;		//stops enemy movement
	
		if (o_player.facing="right"){_enemy.vel_x+=knockback * _enemy.knockback_resist;}
		else{_enemy.vel_x-=knockback  * _enemy.knockback_resist;}
	/*with(other){
		alarm[0]=other.applied_iframes;	//starts enemies iframe timer
		alarm[4]=10;
		if(other.contact_disable>0){
			contact_active=false;
			alarm[3]=other.contact_disable;
		}
		visible=true;
		
	}*/
	_enemy.alarm[0] = applied_iframes;
	_enemy.alarm[4] = 10;
	if (contact_disable>0){
		_enemy.contact_active=false;
		_enemy.alarm[3]=contact_disable;
	}
	_enemy.visible=true;
		
	audio_play_sound(snd_hit,1,false);	//play a hit sound effect
	
	
	if(freeze>0){
		alarm[2]=2;
		//hitfreeze(freeze);
	}
}