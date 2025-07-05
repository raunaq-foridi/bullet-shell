/// @description Insert description here
// You can write your code in this editor
//Room persistence
var _room_name = room_get_name(room);
var _room_map = ds_map_create();

with (all){
	//This is a BAD way to do this. Consider wisely.
	if (variable_instance_exists(id,"keep_state")){
		var _key = ""
		_key += object_get_name(object_index);
		_key += "#x"+string(start_x);
		_key+= "#y"+string(start_y);
		
		ds_map_add(_room_map,_key,state);
	}
}
ds_map_add_map(room_saves,_room_name,_room_map);