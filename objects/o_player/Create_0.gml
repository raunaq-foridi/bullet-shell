/// @description Insert description here
// You can write your code in this editor

hp = 6;
max_hp=6;

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

iframes=100; //self explanatory.
invincible=false; //Whether or not in iframes
blink=false;	//visibility while "flashing" iframes
blink_time=10;
alarm[1]=blink_time;

facing = "right";	//which direction player is facing