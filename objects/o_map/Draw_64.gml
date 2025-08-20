/// @description Insert description here
// You can write your code in this editor

//iterate over the visited_rooms ds_grid
//var _tooltip_pos = [0,0];
draw_set_alpha(0.95);
var _tooltip_pos=[0,0]
var _tooltip = "";
var _name = "";
var _current_room = [0,0];
for(var _y=map_start_y;_y<map_height;_y++){
for(var _x=map_start_x;_x<map_width;_x++){

	if(_x>global.world_map_width or _y>global.world_map_height){continue}
	//draw_sprite(s_map_cell,visited_rooms[# _x,_y],x_pos + _x*cell_size,y_pos + _y*cell_size);
	if(transparent_map==true and visited_rooms[# _x,_y]==0){
		o_keyboard_controller.keyboard_grid[# _x, _y] = 0;
		continue
	}
	else{o_keyboard_controller.keyboard_grid[# _x, _y] = 1;}
	
	draw_sprite_stretched(s_map_cell,visited_rooms[# _x,_y],x_pos + _x*cell_size,y_pos + _y*cell_size,cell_size,cell_size);
	draw_set_alpha(1);
	if(visited_rooms[# _x,_y]==2){_current_room=[_x,_y];}
	
	
	var _x_pos = x_pos + _x*cell_size;
	var _y_pos = y_pos + _y*cell_size;
	
	var _cell_info = global.room_info[# _x, _y];
	if(_cell_info==0 or is_undefined(_cell_info) ){
		//continue
		_cell_info = {
			tooltip : "",
			name : "",
			checkpoint : false,
			savepoint : false,
			icon : noone,
			room : noone,
		}
	}	
	//Savepoint takes priority over other conditions
	if(_cell_info.savepoint == true){
		draw_sprite_stretched(s_save_icon,-1, _x_pos, _y_pos, cell_size,cell_size);
	}
	else if (_cell_info.checkpoint == true){
		draw_sprite_stretched(s_checkpoint,1, _x_pos, _y_pos, cell_size,cell_size);	
	}
	else if (_cell_info.icon != noone){
		draw_sprite_stretched(_cell_info.icon,-1, _x_pos, _y_pos, cell_size,cell_size);
	}
	
	//Deal with hovering/interactions in the same way as the Inventory
	
	var _selected = false;
	var _mouse_x = window_mouse_get_x();
	var _mouse_y = window_mouse_get_y();
	
	
	//if(not _cell_info==0 and not is_undefined(_cell_info)){_name = _cell_info.name;}
	//check if slot is hovered/selected: [done in this way as to allow keyboard controls later]
	if (window_mouse_get_x()>_x_pos and window_mouse_get_x()<_x_pos+cell_size
	and window_mouse_get_y()>_y_pos and window_mouse_get_y()<_y_pos+cell_size){
		_selected=true;
		_tooltip = _cell_info.tooltip;
		//_name = _cell_info.name;
		
		_tooltip_pos = [_x_pos,_y_pos];
		
	
	}
	if (array_equals(o_keyboard_controller.keyboard_pos, [_x,_y])){
		draw_sprite_stretched(s_map_select,1, _x_pos, _y_pos, cell_size,cell_size);
		_selected=true;	
		_tooltip = _cell_info.tooltip;
		//_name = _cell_info.name;
		
		_tooltip_pos = [_x_pos,_y_pos];
	}
	if(_selected and (mouse_check_button_released(mb_left) or input_check_released("select")) ){
		print(_cell_info);
		if(teleportation==true and _cell_info.checkpoint==true){
			print("teleporting");
			room_goto(_cell_info.room);
			o_player.teleporting=true;
		}
	}
}
}
draw_set_alpha(1);
draw_text(_tooltip_pos[0],_tooltip_pos[1],_tooltip);

var _total_width = map_width *cell_size;
var _centre_pos = x_pos + _total_width/2;

var _current_room_info = global.room_info[# _current_room[0], _current_room[1] ];
if(not _current_room_info==0 and not is_undefined(_current_room_info)){
	_name = _current_room_info.name;
}

draw_set_halign(fa_center);
draw_text_transformed(_centre_pos,y_pos,_name,2,2,0);
draw_set_halign(fa_left);
current_room=_current_room;