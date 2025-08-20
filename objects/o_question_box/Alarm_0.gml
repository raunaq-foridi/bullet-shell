/// @description Select only after 1 frame delay

var _func_array = functions[selection];

var _func = array_shift(_func_array);	//removes first element, too

script_execute_ext(_func,_func_array);
if(not continuing_dialogue){
	o_player.alarm[4]=1;	//resets occupied state after 1 frame
}
instance_destroy();