/// @description Insert description here
// You can write your code in this editor
if (y_offset<max_scroll-2){
	y_offset+=1;
	for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
		cleanup_list[| _i].y-=1;
	}
}
