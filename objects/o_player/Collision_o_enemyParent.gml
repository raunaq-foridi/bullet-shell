/// @description Enemy Collision

if (invincible=false){
	hp-=other.contact;	//using "other" to select the specific enemy. 
	alarm[0]=iframes;	//cancels iframes after alarm is up
	invincible=true;
	
	//knockback
	
	var _x= x-other.x;
	var _y= y-other.y;	//Vector distance between player and enemy
	var _norm = sqrt(sqr(_x)+sqr(_y)) //pythagoras go brr
	
	vel_x= _x/_norm *other.knockback;
	vel_y= _y/_norm *other.knockback;
	
}