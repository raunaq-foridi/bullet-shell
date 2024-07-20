// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//for debugging purposes
//acts like Python Print. pass variables or strings, print them to console
function print(){
	var _output="";
	var _str = "";
	
	for (var _i=0; _i<argument_count; _i++){
		_str = argument[_i];
		if(not is_string(_str)) {_str = string(_str)}
		
		_output+= _str + " ";
	}
	
	show_debug_message(_output);
}