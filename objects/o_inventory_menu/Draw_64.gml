/// @description Insert description here
// You can write your code in this editor
o_player.occupied=true;

var _mouse_x = window_mouse_get_x();
var _mouse_y = window_mouse_get_y();
//Draw Background
mousing = false;
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

//take over with mouse if hovering
var _total_width = (item_size + item_padding) * list_width;
var _total_height =(item_size + item_padding) * list_height;
if (window_mouse_get_x()>inv_x_pos + inv_padding and window_mouse_get_x()<inv_x_pos + inv_padding +_total_width
	and window_mouse_get_y()>inv_y_pos + inv_padding and window_mouse_get_y()<inv_y_pos + inv_padding +_total_height){
	mousing=true;	
}
for (var _i=0; _i<INV_SIZE;_i++){
	var _item = _inventory[_i];
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
		if (mouse_check_button_released(mb_left)){
			if(_item[0]!=0 and _item[1]>0){
				
				//If the same item as the held equip slot is clicked, return the item to the inventory
				if(held==-2 and small_slots[0]==_item[0]){
					with(o_manager){
						item_pickup(other.small_slots[0]);
					}
					small_slots[0]=0;
					held=-1
				}
				else if(held==-3 and small_slots[1]==_item[0]){
					with(o_manager){
						item_pickup(other.small_slots[1]);
					}
					small_slots[1]=0;
					held=-1
				}
				//otherwise, hold the new item
				else{held=_i;}
			}
			else{
				//clear equipment by clicking on empty slot
				if(held==-2){
					//return the item to inventory
					with(o_manager){
						item_pickup(other.small_slots[0]);
					}
					small_slots[0]=0;		
				}			
				else if(held==-3){
					with(o_manager){
						item_pickup(other.small_slots[1]);
					}
					small_slots[1]=0;
				}
				held=-1;
			}
		}
	}
	//else{_selected=false;}
	
	//beginning of keyboard control code
	
	else if (o_keyboard_controller.keyboard_pos[0]==_grid_x and o_keyboard_controller.keyboard_pos[1]==_grid_y+1
			and not mousing){
		//print(_grid_x,_grid_y,"is selected");
		_selected = true;	
		selected = _i;
		_tooltip_pos=[_x,_y];
		
		//REFACTOR THIS CODE LATER. DUPLICATED AND MESSY
		//if (mouse_check_button_released(mb_left)){
		if(keyboard_check_released(vk_enter)){
			print("Im TRYINg ok???");
			if(_item[0]!=0 and _item[1]>0){
				
				//If the same item as the held equip slot is clicked, return the item to the inventory
				if(held==-2 and small_slots[0]==_item[0]){
					with(o_manager){
						item_pickup(other.small_slots[0]);
					}
					small_slots[0]=0;
					held=-1
				}
				else if(held==-3 and small_slots[1]==_item[0]){
					with(o_manager){
						item_pickup(other.small_slots[1]);
					}
					small_slots[1]=0;
					held=-1
				}
				//otherwise, hold the new item
				else{held=_i;}
			}
			else{
				//clear equipment by clicking on empty slot
				if(held==-2){
					//return the item to inventory
					with(o_manager){
						item_pickup(other.small_slots[0]);
					}
					small_slots[0]=0;		
				}			
				else if(held==-3){
					with(o_manager){
						item_pickup(other.small_slots[1]);
					}
					small_slots[1]=0;
				}
				held=-1;
			}
		}
		
		
	}

	
	
	//Render the slot
	if (slot_sprite == -1){
		//draw default square
		draw_set_color(c_black);
		if((_selected ==true and selected==_i) or held ==_i){
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
	//var _item = _inventory[_i];
	//Reminder: Inventory is an array of arrays, each element being [item_id, amount]
	if (_item[0]==0){continue}	//ignore empty slots. Technically, since slots fill left to right, "break" should suffice.
	
	//retrieve item information
	var _item_properties = global.item[_item[0]];
	var _sprite = _item_properties[ITEM_PROP.SPRITE];
	//print(_sprite);
	//print(sprite_get_name(_sprite));
	//print(_item_properties);
	
	//if(_sprite==0){continue} //Mostly to avoid crashes if sprite has not been set.
	//This seems to break things. Unsure why. Funny - it was meant to *Avoid* crashes.
	
	//draw the sprite
	var _draw_x = _x + _slotsize* (1-item_scaling)/2 -1		//no clue why its 1 off.
	var _draw_y = _y + _slotsize* (1-item_scaling)/2 -1
	draw_sprite_stretched(_sprite,-1,_draw_x, _draw_y,_slotsize *item_scaling,_slotsize*item_scaling);
	//draw_sprite_ext(_sprite,-1,200,200,1,1,0,c_white,1)
	draw_text(_x,_y,_item[1]); //Consider the following:
	//if(_item[1]!=1){draw_text(_x,_y,_item[1]);} //Dont render count if =1
	
	
	//Below does not work - renders _under_ other sprites.
	//if(_selected){draw_text(window_mouse_get_x(),window_mouse_get_y(),_item_properties[ITEM_PROP.DESCRIPTION]);}
}
//dont worry, this will be cleaned up later.


//Equipment

//equipment slot 1 - coded as "selected = -2"
draw_set_color(c_dkgray);
//if((_mouse_x-200)^2 + (_mouse_y-200)^2 < 50){ draw_set_color(c_ltgray);}	//^ is NOT exponentiation.
if(point_distance(_mouse_x,_mouse_y,200,200)<small_slot_radius or held==-2){ 
	draw_set_color(c_gray);
	selected = -2;
	if (mouse_check_button_released(mb_left)){
		if(held<=-1){held=-2;}
		else if(held>=0){
			//return old item to inventory
			with(o_manager){
				item_pickup(other.small_slots[0]);
			}
			//put item in equipment slot
			small_slots[0]=_inventory[held][0]	//later, update to check if this is suitable equipment.
			_inventory[held][1]-=1;
			held=-1;
		}
	}
}	
draw_circle(200,200,small_slot_radius,false);
draw_set_color(-1);	
if (small_slots[0]!=0){
	var _item_properties = global.item[small_slots[0]];
	var _sprite = _item_properties[ITEM_PROP.SPRITE];
	//print(_item_properties);
	//print(small_slots[0]);
	//draw_sprite(_sprite,-1,200,200);
	var _scale_x = small_slot_radius /sprite_get_width(_sprite);
	var _scale_y = small_slot_radius /sprite_get_width(_sprite);
	var _scale = min(_scale_x,_scale_y);				//To not mess with aspect ratios.
	draw_sprite_ext(_sprite,-1,200,200,_scale,_scale,0,c_white,1);
	
}

//equipment slot 2 - coded as "selected = -3"
draw_set_color(c_dkgray);
if(point_distance(_mouse_x,_mouse_y,300,200)<small_slot_radius or held==-3){ 
	draw_set_color(c_gray);
	selected = -3;
	if (mouse_check_button_released(mb_left)){
		if(held<=-1){held=-3;}
		else if(held>=0){
			//return old item to inventory
			with(o_manager){
				item_pickup(other.small_slots[1]);
			}
			//put item in equipment slot
			small_slots[1]=_inventory[held][0]	//later, update to check if this is suitable equipment.
			_inventory[held][1]-=1;
			held=-1;
		}
	}
}	
draw_circle(300,200,small_slot_radius,false);
draw_set_color(-1);	
if (small_slots[1]!=0){
	var _item_properties = global.item[small_slots[1]];
	var _sprite = _item_properties[ITEM_PROP.SPRITE];
	var _scale_x = small_slot_radius /sprite_get_width(_sprite);
	var _scale_y = small_slot_radius /sprite_get_width(_sprite);
	var _scale = min(_scale_x,_scale_y);				//To not mess with aspect ratios.
	draw_sprite_ext(_sprite,-1,300,200,_scale,_scale,0,c_white,1);
	
}

//Draw Tooltip
if(selected>=0 and not array_equals(_tooltip_pos,[0,0])){
	var _item = _inventory[selected];
	var _item_properties = global.item[_item[0]];
	draw_text(_tooltip_pos[0],_tooltip_pos[1],_item_properties[ITEM_PROP.DESCRIPTION]);
	//Alternate way, to draw text at the mouse
	//draw_text(window_mouse_get_x(),window_mouse_get_y(),_item_properties[ITEM_PROP.DESCRIPTION]);
}