/// @description Insert description here
// You can write your code in this editor
event_inherited();

keep_state = true;		//Is this remembered after moving to the next room?
save_state = true;		//Is this saved during a game save/ permanently remembered?
//must be defined for any saved
start_x=x;
start_y=y;

activated = false;
//tag used for objects controlled by the lever.
state=[["activated",false],["tag",tag]];

function interaction(){
	activated = not activated;	
}