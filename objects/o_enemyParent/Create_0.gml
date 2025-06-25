/// @description Initialise default enemy
// This should act as a "template"

//other enemy types should use this as a parent, and inherit it's properties
//if in doubt, copy paste this into each enemy and mod from there.

hp = 10; 
contact = 1;  //contact damage. Unsure if it'll ever be greater than 1 but yeah.
knockback=1;

iframes=20;
invincible=false;

grounded=false;
terminal_speed=100;
grav_speed=1;

vel_x=0;
vel_y=0;

stunned=0;

blink=4;
alarm[1]=blink;	//how many frames it takes to blink

knockback_resist=1;	//divisor: 0.5 means "takes half knockback"

gears = [3];		//how many gears the enemy drops on death. 
gear_value=[1];	//The values the gears can take.
				//gears = [3,1] means 3 of the first value, 1 of the second.
bonus_gears=0;	//creates the above number, plus up to this many uniformly ( uniform [0,n] inclusive)
gear_directions=[0,360];	//Limit the directions gears can fly out at. Make sure the second number is larger, i.e [330,390] rather than [330,30]
gear_strength=5;// limit the speed at which gears fly out.

function movement_ai(){}	//blank function. use in child objects.