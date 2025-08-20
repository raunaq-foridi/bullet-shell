/// @description Insert description here
// You can write your code in this editor
//hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

var _range = full_x - empty_x;
//x = empty_x + variable_global_get(variable) *_range;
var _displacement = x - empty_x;

progress = _displacement/_range;
var _output = (range[1]-range[0])*progress + range[0];

variable_global_set(variable,_output);

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
if(hovering){
	//print("Hobaa");
	//image_index=SPRITES.OFF_HOVERED;
	if (input_check("move_right") and progress<=1){
		//clicked=true;
		x+=1
	}
	else if(input_check("move_left") and progress>=0 ){
		x-=1;	
	}
}