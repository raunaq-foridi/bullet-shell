/// @description Melee damage

if (not other.invincible and attacking){
	other.hp-=1;
	print(other.hp);
	other.invincible=true;
	alarm[0]=other.iframes;
	other_object=other;
}

