/// @description Persistence, saving and maps

//Room persistence
if(loading){exit}	//dont run room end if Loading file
var _room_name = room_get_name(room);
var _room_struct={};
var _save_data_struct={};

with (all){
	//This is a BAD way to do this. Consider wisely.
	if (variable_instance_exists(id,"keep_state")){
		var _key = ""
		_key += object_get_name(object_index);
		_key += "#x"+string(start_x);
		_key+= "#y"+string(start_y);
		
		//Populate _room_struct with all persistent details of that specific room
		variable_struct_set(_room_struct,_key,state);
	}
	//Repeat again, but for permanently saved things
	if (variable_instance_exists(id,"save_state")){
		if(save_state==false){continue}
		var _key = ""
		_key += object_get_name(object_index);
		_key += "#x"+string(start_x);
		_key+= "#y"+string(start_y);
		
		//Again, fill _save_data_struct with persistent details. These will be the ones kept when saving and loading
		variable_struct_set(_save_data_struct,_key,state);
	}
}
//Use room_saves_struct to save each rooms data, keyed by room name
variable_struct_set(room_persist_struct,_room_name,_room_struct);
variable_struct_set(game_save_struct,_room_name,_save_data_struct);

