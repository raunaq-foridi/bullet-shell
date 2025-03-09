/// @description Insert description here
// You can write your code in this editor
//hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

var _range = full_x - empty_x;
//x = empty_x + variable_global_get(variable) *_range;
var _displacement = x - empty_x;

progress = _displacement/_range;

variable_global_set(variable,progress);