/// @description Insert description here
// You can write your code in this editor
loading=false;
if (not struct_exists(room_persist_struct,room_get_name(room))){
	print("No room data found");
	if (not struct_exists(game_save_struct,room_get_name(room))){exit}
	print("Saved data found");
	var _saved_state= game_save_struct[$ room_get_name(room)];
	//print(_saved_state);
	with(all){
		if (variable_instance_exists(id,"save_state")){
			if(save_state==false){continue}
			var _key = ""
			_key += object_get_name(object_index);
			_key += "#x"+string(x);
			_key+= "#y"+string(y);
			//print(_key);
			state = _saved_state[$ _key];
			//iterate over states
			//print(_key,state);
			if(is_undefined(state)){
				//print(_key, "destroyed",state);
				instance_destroy();
				//continue;
			}
			for (_i=0;_i<array_length(state);_i++){
				//state is made up of arrays, [variable,value]
			
				variable_instance_set(id,state[_i][0],state[_i][1]);
				//print(_key,state);
			}
		}
	}
	exit
}
var _room_state2= room_persist_struct[$ room_get_name(room)];
//var _room_state2= game_save_struct[$ room_get_name(room)];
//print(_room_state[? ds_map_find_first(_room_state)]);
//print(_room_state);
with(all){
	print("room data found");
	if (variable_instance_exists(id,"keep_state")){
		//if(save_state==false){continue}
		var _key = ""
		_key += object_get_name(object_index);
		_key += "#x"+string(x);
		_key+= "#y"+string(y);
		
		state = _room_state2[$ _key];
		//iterate over states
		//print(state);
		if(is_undefined(state)){
			instance_destroy();
			//continue;
		}
		for (_i=0;_i<array_length(state);_i++){
			//state is made up of arrays, [variable,value]
			
			variable_instance_set(id,state[_i][0],state[_i][1]);
			//print(_key,state);
		}
	}
}

