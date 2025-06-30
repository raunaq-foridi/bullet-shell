/// @description Insert description here
// You can write your code in this editor

event_inherited();
grav_speed=0;
terminal_speed=0;

knockback=5;

initial_y=y;
vel_y=5;

hp = 5;		//nerfed after player feedback

timer=0;
gears = [10,2];
gear_value=[1,20];
gear_strength = 20;
gear_directions=[330,390];
function movement_ai(){
		var _displacement_y=y-initial_y;
		vel_y-=_displacement_y*0.05
		timer+=1;
}