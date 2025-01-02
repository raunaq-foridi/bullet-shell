/// @description Insert description here

x+=vel_x;	//note, repeat_move() is NOT used. 
y+=vel_y;	//repeat_move() prevents moving into a tile
if (duration<=0){instance_destroy();}
if(destroy_on_tile and detect_tile(0,0)){instance_destroy();}