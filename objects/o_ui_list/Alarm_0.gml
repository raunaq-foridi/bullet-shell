/// @description perform on the frame AFTER creation

for(var _i=0; _i<array_length(other_lists); _i++){
	create_button(x +50 + 50*_i,y -20 ,1,1,"",change_menu,[other_lists[_i],other_lists],[_i+1,0],true);
}


with(o_keyboard_controller){
	keyboard_pos=[0,0];
	ds_grid_resize(keyboard_grid,array_length(other.other_lists)+1,ds_list_size(other.list)+1);
	print("Grawawa");
	print(ds_grid_height(keyboard_grid));
	ds_grid_clear(keyboard_grid,0.4);
	//ds_grid_set(keyboard_grid,0,0,0);
	var _dummy_counter=0
	//set all of first row to 1
	for (var _i=0; _i<ds_grid_width(keyboard_grid); _i++){
		ds_grid_set(keyboard_grid,_i,0,1);
	}
	for (var _j=0; _j<ds_grid_height(keyboard_grid); _j++){
		ds_grid_set(keyboard_grid,0,_j,1);
		if (is_array(other.list[| _j]) and other.list[| _j][UI.TEXT]==""){_dummy_counter+=1;}
	}
	ds_grid_resize(keyboard_grid,array_length(other.other_lists)+1,ds_list_size(other.list)+1-_dummy_counter);
	print(ds_grid_height(keyboard_grid));
}

//ds_grid_resize(o_keyboard_controller.keyboard_grid,1,ds_list_size(other.list))
//ds_grid_resize(o_keyboard_controller.keyboard_grid,4,10)
//o_keyboard_controller.keyboard_pos = [0,1];