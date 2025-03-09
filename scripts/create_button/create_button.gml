// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_button(_x,_y,_width,_height,_text,_script,_arguments){
	if(is_undefined(_arguments)){_arguments=[];}
	var _button = instance_create_layer(_x,_y,layer_get_id("Instances"),o_generic_button);
	with(_button){
		
		width= _width;
		height= _height;
		x=_x;
		y=_y;
		text = _text;
		script= _script;		//pass a script without parentheses, eg print or create_button
		arguments=_arguments		//Pass a list of parameters to pass through the script
	}
}

function create_toggle(_x,_y,_width,_height,_text,_bool,_cleanup,_align){
	if(is_undefined(_align)){_align="right";}
	var _toggle = instance_create_layer(_x,_y,layer_get_id("Instances"),o_toggle);
	with(_toggle){
		x=_x;
		y=_y;
		toggle=_bool;
		text=_text;
		align=_align;
	}
	//add to _cleanup list
	ds_list_add(_cleanup,_toggle);
}

function create_slider(_x,_y,_width,_height,_text,_var,_cleanup,_range,_align){
	if(is_undefined(_align)){_align="right";}
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
		with(_slot){
			bar=_bar
		}
		x = empty_x + variable_global_get(variable) *(full_x - empty_x);
	}
	ds_list_add(_cleanup,_bar);
}

function create_text_toggle(_x,_y,_width,_height,_values,_var,_cleanup,_align){
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
	}
}