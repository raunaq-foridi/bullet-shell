/// @description Insert description here
// You can write your code in this editor

//selection code

if(not is_array(keyboard_pos)){
	exit}
if (array_equals(o_keyboard_controller.keyboard_pos,keyboard_pos)
	or position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){
		hovering=true;}
else{
	hovering = false;
	//print("Compare",keyboard_pos,"to",o_keyboard_controller.keyboard_pos);
}
if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)){mouse_hover=true;}
else{mouse_hover=false};
if(hovering){
	if(keyboard_check_pressed(global.keys.select)){
		current+=1;
		if current>=array_length(values){
			current=0;}
	}
}