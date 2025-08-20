/// @description Insert description here
// You can write your code in this editor

var _kb_grid = o_keyboard_controller.keyboard_grid
if (ds_grid_width(_kb_grid)!=list_width or ds_grid_height(_kb_grid)!=list_height+1){
	print(ds_grid_width(_kb_grid),list_width);
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

//Close inventory

if(input_check_pressed("inventory")){alarm[0]=1;}