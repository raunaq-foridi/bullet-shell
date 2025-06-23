/// @description Insert description here
// You can write your code in this editor
with(bar){
	if(grabbing){
		var _old_dist = y-full_y;
		var _old_prog = _old_dist/(empty_y-full_y);
		
		y = clamp(window_mouse_get_y(),full_y,empty_y);
		var _dist = y-full_y;
		var _prog = _dist/(empty_y-full_y);
		
		var _prog_change = _prog - _old_prog;
		//if (abs(_prog_change)<=0.01){_prog_change=0;}	//Remove subpixel errors, hopefully.
		_prog_change+=0.0088;
		print(_prog_change);
		if (other.ui_list!=""){
			other.ui_list.y_offset = _prog*other.ui_list.max_scroll;
			
			//experimental
			with (other.ui_list){
				for (var _i=0; _i<ds_list_size(cleanup_list); _i++){
					cleanup_list[| _i].y-=_prog_change*max_scroll;
				}
			}
			//end of experiment
		}
		//print(y,full_y);
	}
}