/// @description Player collision


if (other.invincible=false){
	other.hp-=contact;	
	other.alarm[0]=other.iframes;
	other.invincible=true;
	
	//knockback
	
	var _sign= sign(x-other.x);
	other.vel_x+=knockback*_sign;
	
	if(destroy_on_collision){instance_deactivate_object(self);}
	
}