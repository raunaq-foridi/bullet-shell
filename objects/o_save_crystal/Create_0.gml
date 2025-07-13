/// @description An object to save through. will later bring up a menu

event_inherited();
//purely for oscillatory effect
start_x=x;
start_y=y;
bounce_range=20;
timer=0;

function interaction(){
	save();	//This will later instead open a menu, and that menu will allow you to save
}