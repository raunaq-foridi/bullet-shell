/// @description Melee damage

if (not other.invincible and attacking){
	other.hp-=1;
	print(other.hp);
	
	other.invincible=true;	//makes enemy invulnerable
	other.stunned=stun;		//stops enemy movement
	
	with(other){alarm[0]=iframes;}	//starts enemies iframe timer
}

