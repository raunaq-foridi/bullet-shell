/// @description Initialise default enemy
// This should act as a "template"

//other enemy types should use this as a parent, and inherit it's properties
//if in doubt, copy paste this into each enemy and mod from there.

keep_state = true;		//Is this remembered after moving to the next room?
save_state = false;		//Is this saved during a game save/ permanently remembered?
//must be defined for any saved
start_x=x;
start_y=y;
state = [];
//state filled in step function
alive=true;

hp = 10; 
contact = 1;  //contact damage. Unsure if it'll ever be greater than 1 but yeah.
knockback=1;
contact_active = true;

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

drops=false;
gears = [3];		//how many gears the enemy drops on death. 
gear_value=[1];	//The values the gears can take.
				//gears = [3,1] means 3 of the first value, 1 of the second.
bonus_gears=0;	//creates the above number, plus up to this many uniformly ( uniform [0,n] inclusive)
gear_directions=[0,360];	//Limit the directions gears can fly out at. Make sure the second number is larger, i.e [330,390] rather than [330,30]
gear_strength=5;// limit the speed at which gears fly out.

flash = 5; //frames for which to flash for if hit
hit = false;	//Boolean to store when hit by the player. deactivate manually after used.

anim_death = sprite_index;	//change to death sprite
dying = false;

alarm[2]=1;
function movement_ai(){}	//blank function. use in child objects.
function animation(){}		//blank function to animate. Use in child objects.

hurtboxes = [];
function make_hurtboxes(){
	//var _cx = x - (bbox_left + bbox_right)/2 + sprite_get_xoffset(sprite_index);
	//var _cy = y - (bbox_top + bbox_bottom)/2 + sprite_get_yoffset(sprite_index);
	
	
	var _w = abs(bbox_right-bbox_left);
	var _h = abs(bbox_bottom - bbox_top);

	var _cx = _w/2 - sprite_get_xoffset(sprite_index)/3;
	var _cy = _h/2 - sprite_get_yoffset(sprite_index)/3;

	array_push(hurtboxes, enemy_hurtbox(_cx,_cy,_w,_h));
	
}
function destroy_hurtboxes(){
	var _f = function(_element,_index){instance_destroy(_element);}
	array_foreach(hurtboxes,_f);
}
make_hurtboxes()