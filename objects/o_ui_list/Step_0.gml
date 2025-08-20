/// @description Insert description here
// You can write your code in this editor

var _keypos = o_keyboard_controller.keyboard_pos[1];
if (_keypos==0){exit}

var _current_pos = y+item_height*(_keypos-1) -y_offset;		//the (rough) y pos of the currently hovered item

print(_current_pos);
if (_current_pos>distance_before_scroll){
	//print("WAAAAAAA");
	/*if (y_offset>0){
		y_offset-=scroll_modifier;
		for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
			cleanup_list[| _i].y+=scroll_modifier;
		}
	}*/
	if(y_offset<max_scroll-scroll_modifier-snap_modifier){
		y_offset+=scroll_modifier+snap_modifier;
		for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
			cleanup_list[| _i].y-=scroll_modifier+snap_modifier;
		}	
	}
	
}
if (_current_pos<upwards_before_scroll){
	/*if (_current_pos>distance_before_scroll){
		y_offset+=scroll_modifier;
		for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
			cleanup_list[| _i].y-=scroll_modifier;
		}
	}*/
	if (y_offset>scroll_modifier+snap_modifier){
		y_offset-=scroll_modifier+snap_modifier;
		for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
			cleanup_list[| _i].y+=scroll_modifier+snap_modifier;
		}
	}
}

