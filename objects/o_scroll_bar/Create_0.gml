/// @description Insert description here
// You can write your code in this editor
image_angle=90;
depth=-200;
rel_y = 0;			//Compared to the parent, how far up is it?
					//should be negative at empty, 0 at full
progress = 0;		//percantage across the slider the bar lays.

full_y = 0;			//where do "fully up" and "fully down" lie?
empty_y =100;			//should be set when created

scale=1;

hovering = false;
grabbing = false;
text="";