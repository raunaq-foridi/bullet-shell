/// @description Insert description here
// You can write your code in this editor

snap_x=false;		//does the player snap to the climbables x position?
snap_y=false;
lock_x=false;		//Can the player move left/right while climbing this?
lock_y=false;		//Likewise, up/down
clamp_x=-1;			//maximum range the player can move from the climbables centre
clamp_y=-1;			//currently unimplemented. -1 acts as "unclamped"
bonus_speed=0;		//

rel_x=0;		//used by player to snap on, distance between player and objects centre
rel_y=0;		//Should be set to 0, so that o_player code can set it to relevant value

momentum_x=0;		//NOT automatic. should be set to the objects equivalent of vel_x
momentum_y=0;		//likewise, set to vel_y equivalent.
					//Could be used _as_ vel_x or vel_y. don't see why not.