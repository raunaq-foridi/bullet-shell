/// @description Insert description here
// You can write your code in this editor

hp = 6;
max_hp=6;

grounded = false;
grounded_x = x;	//position of last point the player was grounded
grounded_y = y;

vel_x = 0;	//Velocity for next step; passed into repeat_move()
vel_y = 0;

max_vel=100;
grav_speed=1; //Strength of gravity on player
terminal_speed=200; //maximum fall speed
friction_power=1; //How "slippery" motion feels. 0 is basically ice physics.
air_resistance=1; //How quickly you lose horizontal momentum midair when not holding a key down. Constant.
linear_drag = 0;	//scales with velocity. Should be much lower than 1.
quadratic_drag=0;	//Scales with velocity^2. Should be MUCH lower than 1.
slope_max=4;		//maximum size of a jump that can be automatically climbed

					

move_speed = 5;
jump_speed= 10;
swim_speed = 5;		//speed of ascent in water
swim_acceleration = 1;	//acceleration of ascent in water
water_drag=2;		//loss of vertical momentum when falling into water from air
water_dash = 8;		//strength of water dash
dash_cooldown = 60;
swim_cooldown=5;	//frames after entering water that you cannot ascend

alternate_dash=true;	//enables a different water dash
dashing=false;
dash_time = 10;			//how long the dash lasts.

iframes=100; //self explanatory.
invincible=false; //Whether or not in iframes
blink=false;	//visibility while "flashing" iframes
blink_time=10;
alarm[1]=blink_time;

facing = "right";	//which direction player is facing, "left" or "right"
dir = [1,0];		//direction as non-normalised vector. y is downwards.
dash_dir=[1,0];
water = false;