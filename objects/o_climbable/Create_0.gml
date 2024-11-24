/// @description Insert description here
// You can write your code in this editor

snap_x=false;		//does the player snap to the climbables x position?
snap_y=false;
lock_x=false;		//Can the player move left/right while climbing this
lock_y=false;		
clamp_x=0;		//maximum range the player can move from the climbables centre
clamp_y=0;		//currently unimplemented. -1 acts as "unclamped"

rel_x=0;		//used by player to snap on