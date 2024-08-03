/// @description Insert description here
// You can write your code in this editor

event_inherited();
grav_speed=0;
terminal_speed=0;

knockback=5;

initial_y=y;
vel_y=5;

timer=0;
function movement_ai(){
		var _displacement_y=y-initial_y;
		vel_y-=_displacement_y*0.05
		timer+=1;
}