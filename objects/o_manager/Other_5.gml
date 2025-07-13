/// @description Insert description here
// You can write your code in this editor
//Room persistence
var _room_name = room_get_name(room);
var _room_map = "";
var _room_struct={};
if (not ds_map_exists(room_saves,_room_name)){
	_room_map = ds_map_create();
}
else{
	ds_map_destroy(room_saves[? _room_name]);
	ds_map_delete(room_saves,_room_name);
	_room_map = ds_map_create();
	//_room_map = room_saves[? _room_name];
}

with (all){
	//This is a BAD way to do this. Consider wisely.
	if (variable_instance_exists(id,"keep_state")){
		var _key = ""
		_key += object_get_name(object_index);
		_key += "#x"+string(start_x);
		_key+= "#y"+string(start_y);
		
		variable_struct_set(_room_struct,_key,state);
		ds_map_set(_room_map,_key,state);
	}
}
//ds_map_delete(room_saves,_room_name);
//ds_map_replace(room_saves,_room_name,_room_map);
ds_map_add_map(room_saves,_room_name,_room_map);
variable_struct_set(room_saves_struct,_room_name,_room_struct);
//ds_map_destroy(_room_map);