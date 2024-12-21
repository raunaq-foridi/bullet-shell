/// @description Insert description here
// You can write your code in this editor



hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
if(hovering){
	image_index=1;
	if (clicked){
		image_index=2;
	}
}
else{
	image_index=0;
}