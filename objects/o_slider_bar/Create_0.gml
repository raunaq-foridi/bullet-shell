/// @description Insert description here

depth=-200;
rel_x = 0;			//Compared to the parent, how far right is it?
					//should be negative at empty, 0 at full
progress = 0;		//percantage across the slider the bar lays.

full_x = 0;			//where do "fully right" and "fully left" lie? (full =fully right)
empty_x =0;			//should be set when created by function

variable = "";		//should be set on creation/inherited from slider

slider = "";		//the id of the slider this bar is bound to. Set on creation
scale=1;

hovering = false;
grabbing = false;
text=""

range=[0,1];