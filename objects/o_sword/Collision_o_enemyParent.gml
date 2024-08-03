/// @description Melee damage

if (not other.invincible and attacking){
	other.hp-=1;
	//print(other.hp);
	
	other.invincible=true;	//makes enemy invulnerable
	other.stunned=stun;		//stops enemy movement
	
		if (o_player.facing="right"){other.vel_x+=knockback * other.knockback_resist;}
		else{other.vel_x-=knockback  * other.knockback_resist;}
	with(other){
		alarm[0]=iframes;	//starts enemies iframe timer
	}
		
	audio_play_sound(snd_hit,1,false);	//play a hit sound effect
}

