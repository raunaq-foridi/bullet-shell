
if (keyboard_check_pressed(global.keys.inventory) and not o_player.occupied){
	
	instance_activate_object(o_inventory_menu);
	if (not instance_exists(o_inventory_menu)){
		instance_create_layer(x,y,"Instances",o_inventory_menu);
		instance_activate_object(o_inventory_menu);
	}
	o_inventory_menu.small_slots=o_player.equipment;
	if(o_player.occupied=false){o_player.occupied = true;}
	with (o_keyboard_controller){
		keyboard_pos=[0,0];
	
		//resize the keyboard grid to the inventory + a row for equipment. Populate with 1s in appropriate locations
		ds_grid_resize(keyboard_grid,o_inventory_menu.list_width,o_inventory_menu.list_height+1);
		ds_grid_set(keyboard_grid,0,0,0.6);
		ds_grid_set(keyboard_grid,1,0,1);
		ds_grid_set(keyboard_grid,2,0,0.4);
		ds_grid_set(keyboard_grid,3,0,1);
		ds_grid_set(keyboard_grid,4,0,0.4);
		ds_grid_set_region(keyboard_grid,0,1,o_inventory_menu.list_width,o_inventory_menu.list_height+1,1);
	
	}
}

//print(keyboard_lastchar,"LENGTH",string_length(keyboard_lastchar),keyboard_lastkey);