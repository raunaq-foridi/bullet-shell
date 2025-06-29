/// @description Insert description here
// You can write your code in this editor

//Draw Background
if (bg_sprite==-1){	//run if no sprite provided
	//var _camera = view_camera[0];
	//var _vp = room_get_viewport()
	var _view_x = view_wport[0];
	var _view_y = view_hport[0];
	
	//var _view_x = camera_get_view_width(_camera);
	//var _view_y = camera_get_view_height(_camera);
	draw_set_color($636363);
	draw_set_alpha(0.5);
	draw_roundrect(padding_x,padding_y,_view_x-padding_x,_view_y-padding_y,false);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_roundrect(padding_x,padding_y,_view_x-padding_x,_view_y-padding_y,true);
	draw_set_color(-1);
	
}
else{
	draw_sprite_stretched(sprite,image_index,x,y,width,height);	//cranberry
	//draw_sprite_ext(sprite,image_index,x,y)
}

//Draw Inventory 
if (inv_sprite==-1){	//run if no sprite provided
	//var _camera = view_camera[0];
	//var _vp = room_get_viewport()
	var _view_x = view_wport[0];
	var _view_y = view_hport[0];
	
	//var _view_x = camera_get_view_width(_camera);
	//var _view_y = camera_get_view_height(_camera);
	draw_set_color($434343);
	draw_set_alpha(0.7);
	draw_roundrect(inv_x_pos,inv_y_pos,inv_x_pos+inv_width,inv_y_pos+inv_height,false);
	draw_set_color(c_dkgray);
	draw_set_alpha(1);
	draw_roundrect(inv_x_pos,inv_y_pos,inv_x_pos+inv_width,inv_y_pos+inv_height,true);
	draw_set_color(-1);
	
}
else{
	draw_sprite_stretched(sprite,image_index,x,y,width,height);	//cranberry
	//draw_sprite_ext(sprite,image_index,x,y)
}

var _inventory = o_manager.inventory;
var _tooltip_pos = [0,0];
for (var _i=0; _i<INV_SIZE;_i++){
	//idea: grid position. x= _i % list_width; y = _i // list_width
	var _grid_x = _i % list_width;
	var _grid_y = _i div list_width;
	var _slotsize = item_size + item_padding;
	var _x = inv_x_pos + inv_padding + _slotsize*_grid_x;
	var _y = inv_y_pos + inv_padding + _slotsize*_grid_y;
	var _selected = false;
	
	//check if slot is hovered/selected: [done in this way as to allow keyboard controls later]
	if (window_mouse_get_x()>_x and window_mouse_get_x()<_x+_slotsize
	and window_mouse_get_y()>_y and window_mouse_get_y()<_y+_slotsize){
	
		_selected=true;
		selected = _i;
		_tooltip_pos=[_x,_y];
	}
	else{_selected=false;}
	//Render the slot
	if (slot_sprite == -1){
		//draw default square
		draw_set_color(c_black);
		if(_selected){
			draw_set_color(c_gray);	
		}
		//display_mouse_get_y()
		draw_roundrect(_x,_y,_x+item_size,_y +item_size,false);
		draw_set_color(-1);
	}
	else{
		//draw slot if given sprite.	
	}
	//Draw item sprite, if not empty
	var _item = _inventory[_i];
	//Reminder: Inventory is an array of arrays, each element being [item_id, amount]
	if (_item[0]==0){continue}	//ignore empty slots. Technically, since slots fill left to right, "break" should suffice.
	
	//retrieve item information
	var _item_properties = global.item[_item[0]];
	var _sprite = _item_properties[ITEM_PROP.SPRITE];
	//print(_sprite);
	if(_sprite==0){continue} //Mostly to avoid crashes if sprite has not been set.
	//draw the sprite
	var _draw_x = _x + _slotsize* (1-item_scaling)/2 -1		//no clue why its 1 off.
	var _draw_y = _y + _slotsize* (1-item_scaling)/2 -1
	
	draw_sprite_stretched(_sprite,-1,_draw_x, _draw_y,_slotsize *item_scaling,_slotsize*item_scaling);
	
	//Below does not work - renders _under_ other sprites.
	//if(_selected){draw_text(window_mouse_get_x(),window_mouse_get_y(),_item_properties[ITEM_PROP.DESCRIPTION]);}
}
//dont worry, this will be cleaned up later.
if(selected!=-1 and not array_equals(_tooltip_pos,[0,0])){
	var _item = _inventory[selected];
	var _item_properties = global.item[_item[0]];
	draw_text(_tooltip_pos[0],_tooltip_pos[1],_item_properties[ITEM_PROP.DESCRIPTION]);
	}