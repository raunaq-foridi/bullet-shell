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