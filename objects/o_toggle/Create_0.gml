/// @description Insert description here
// You can write your code in this editor
depth=-100;
visible=true;
text="Placeholder Text";
align="left";

state = false;
toggle= "";			//This should be set to a global variable, probably a global variable.
hovering=false;
clicked=false;
keyboard_pos = [0,0] //Where on the grid the toggle is, for o_keyboard_controller to use
					 //Set during object creation
				
mouse_hover = false;

enum TOGGLE_SPRITES{
	OFF,
	OFF_HOVERED,
	ON,
	ON_HOVERED
}