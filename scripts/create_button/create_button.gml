// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_button(_x,_y,_width,_height,_text,_script,_arguments,_keyboard_pos,_textless=false){
	if(is_undefined(_arguments)){_arguments=[];}
	var _button = instance_create_layer(_x,_y,layer_get_id("Instances"),o_generic_button);
	with(_button){
		
		width= _width;
		height= _height;
		x=_x;
		y=_y;
		if(not _textless){text = _text;}
		else{text="";}
		script= _script;		//pass a script without parentheses, eg print or create_button
		arguments=_arguments;		//Pass a list of parameters to pass through the script
		keyboard_pos = _keyboard_pos;
	}
}

function create_toggle(_x,_y,_width,_height,_text,_bool,_cleanup,_keypos,_align){
	if(is_undefined(_align)){_align="right";}
	var _toggle = instance_create_layer(_x,_y,layer_get_id("Instances"),o_toggle);
	with(_toggle){
		x=_x;
		y=_y;
		toggle=_bool;
		text=_text;
		align=_align;
		keyboard_pos=_keypos;
	}
	//add to _cleanup list
	ds_list_add(_cleanup,_toggle);
}

function create_slider(_x,_y,_width,_height,_text,_var,_cleanup,_keypos,_range,_align){
	var _rotation = 0;
	if(is_undefined(_align)){_align="right";}
	else if(_align=="scrollbar"){
			_rotation = 270;
	}
	if(is_undefined(_range)){_range=[0,1];}
	var _slot = instance_create_layer(_x,_y,layer_get_id("Instances"),o_slider_slot);
	with(_slot){
		x=_x;
		y=_y;
		width=_width;
		height=_height;
		variable=_var;
		text=_text;
		align=_align;
		range=_range;		//not used. Should be in _bar
		image_angle = _rotation
	}
	ds_list_add(_cleanup,_slot);
	var _bar = instance_create_layer(_x,_y,layer_get_id("Instances"),o_slider_bar);
	with(_bar){
		x=_x-30;	//initial value. probably full.
		//x=(_x-30) - (6.4*_width - 72)	//set to empty, for debugging
		y=_y-26;
		empty_x=(_x-30) - (6.4*_width - 72)	 //found using maths lmao;
		scale=_height/10;
		full_x=_x-30;
		variable=_var;
		slider=_slot;
		range=_range;
		keyboard_pos= _keypos;
		with(_slot){
			bar=_bar
		}
		var _total_range = range[1]-range[0];
		x = empty_x + (variable_global_get(variable)-range[0]) *(full_x - empty_x)/_total_range;
		image_angle = _rotation
	}
	ds_list_add(_cleanup,_bar);
}

function create_text_toggle(_x,_y,_width,_height,_values,_var,_cleanup,_keypos,_align){
	if(is_undefined(_align)){_align="right";}
	var _obj = instance_create_layer(_x,_y,layer_get_id("Instances"),o_text_toggle);
	with(_obj){
		x=_x;
		y=_y;
		width=_width;
		height=_height;
		variable=_var;
		align=_align;
		values=_values;
		keyboard_pos= _keypos;
	}
	ds_list_add(_cleanup,_obj);
}