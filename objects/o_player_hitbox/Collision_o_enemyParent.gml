/// @description Copied from o_Sword

if (not other.invincible and not waiting){
	other.hp-=1;
	//print(other.hp);
	
	other.invincible=true;	//makes enemy invulnerable
	other.stunned=stun;		//stops enemy movement
	
		if (o_player.facing="right"){other.vel_x+=knockback * other.knockback_resist;}
		else{other.vel_x-=knockback  * other.knockback_resist;}
	with(other){
		alarm[0]=other.applied_iframes;	//starts enemies iframe timer
		alarm[4]=10;
		if(other.contact_disable>0){
			contact_active=false;
			alarm[3]=other.contact_disable;
		}
		visible=true;
		
	}
		
	audio_play_sound(snd_hit,1,false);	//play a hit sound effect
	
	
	if(freeze>0){
		alarm[2]=2;
		//hitfreeze(freeze);
	}
}


