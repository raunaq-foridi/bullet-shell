/// @description Insert description here
// You can write your code in this editor
if (y_offset>0){
	y_offset-=scroll_modifier;
	for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
		cleanup_list[| _i].y+=scroll_modifier;
	}
}
