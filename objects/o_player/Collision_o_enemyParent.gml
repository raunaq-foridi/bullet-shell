/// @description Enemy Collision

if (invincible=false){
	hp-=other.contact;	//using "other" to select the specific enemy. 
	alarm[0]=iframes;	//cancels iframes after alarm is up
	invincible=true;
}
print(hp);