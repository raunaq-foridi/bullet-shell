/// @description Insert description here
// You can write your code in this editor

if(visible){
	var _kb_grid = o_keyboard_controller.keyboard_grid
	if (ds_grid_width(_kb_grid)!=map_width or ds_grid_height(_kb_grid)!=map_height){
		with (o_keyboard_controller){
			keyboard_pos=other.current_room;
			if(instance_exists(o_room_info)){keyboard_pos = [o_room_info.map_x,o_room_info.map_y];}
			//resize the keyboard grid to the inventory + a row for equipment. Populate with 1s in appropriate locations
			ds_grid_resize(keyboard_grid,other.map_width,other.map_height);
			//ds_grid_set_region(keyboard_grid,0,1,o_inventory_menu.list_width,o_inventory_menu.list_height+1,1);
			ds_grid_clear(keyboard_grid,1);
		}
	}
}