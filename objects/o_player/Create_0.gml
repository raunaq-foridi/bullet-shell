/// @description Insert description here
// You can write your code in this editor

hp = 6;
max_hp=6;

grounded = false;
grounded_x = x;	//position of last point the player was grounded
grounded_y = y;

vel_x = 0;	//Velocity for next step; passed into repeat_move()
vel_y = 0;

max_vel=5;
grav_speed=0.2; //Strength of gravity on player
terminal_speed=100; //maximum fall speed
friction_power=1; //How "slippery" motion feels. 0 is basically ice physics.
air_resistance=0; //How quickly you lose horizontal momentum midair when not holding a key down
slope_max=4;		//maximum size of a jump that can be automatically climbed
					

move_speed = 5;
jump_speed= 10;

iframes=100; //self explanatory.
invincible=false; //Whether or not in iframes
blink=false;	//visibility while "flashing" iframes
blink_time=10;
alarm[1]=blink_time;

facing = "right";	//which direction player is facing