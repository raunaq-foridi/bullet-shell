/// @description Insert description here
// You can write your code in this editor

lifespan = 30;		//how many frames is this hitbox active for?
shape = "box";	//Either "box" or "circle"

rel_x = 0;		//Relative position to player (on spawn)
rel_y = 0;

follow_player = false;	//should the object maintain this distance, or just stay stationary?

vel_x = 0;
vel_y = 0;		//if not following, can apply a constant motion.

alarm[0]=1;		//actually set things up. 
				//do important setup during creation

origin = "centre"	//default. Might not implement at all. As opposed to "corner" for topleft
width = 10;
height= 10;

delay = 0;			//How long before this hitbox becomes active?
waiting=false;		//is the delay still going?

//Currently unmodifiable

stun=25;	//how long an enemy will be stunned for [set to 0 to remove]
knockback=5;	//deal knockback in direction opposite to player. 
