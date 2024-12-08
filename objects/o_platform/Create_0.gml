/// @description Insert description here
// You can write your code in this editor

momentum_x=0;	//how much extra velocity is transferred to the player
momentum_y=0;	//when leaving from atop the platform
				//should be set manually.

mov_x=0;		//the platforms speed at the moment
mov_y=0;		//for moving the player alongside the platform
				//set manually	
				
bonus_mov_x=0;	//Additional movement to deal with acceleration
bonus_mov_y=0;	//use for change of direction

clamp_x=10;		//the "pickup" distance for the platform
				//The platform will "ignore" the player until within this range.
				//ignored if 0
			
				
start_x=x;
range=300;
moving="left";