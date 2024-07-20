/// @description Insert description here
// You can write your code in this editor

grounded = false;
grounded_x = x;	//position of last point the player was grounded
grounded_y = y;

vel_x = 0;	//Velocity for next step; passed into repeat_move()
vel_y = 0;

grav_speed=1; //Strength of gravity on player
terminal_speed=100; //maximum fall speed
friction_power=1; //How "slippery" motion feels. 0 is basically ice physics.
air_resistance=1; //How quickly you lose horizontal momentum midair when not holding a key down

move_speed = 5;
jump_speed= 10;