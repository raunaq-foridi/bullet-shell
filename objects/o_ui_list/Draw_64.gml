/// @description draws a menu

//draw background
if (sprite==-1){	//run if no sprite provided
	draw_set_color($636363);
	draw_set_alpha(0.5);
	draw_roundrect(x,y,x+width,y+height,false);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_roundrect(x,y,x+width,y+height,true);
	draw_set_color(-1);
	
}
else{
//populate with a sprite drawing, eventually
}
if (!surface_exists(menu_surf))
{
    menu_surf = surface_create(width, height);
}
surface_set_target(menu_surf);
draw_clear_alpha(c_black, 0);
for (var _i=0; _i<ds_list_size(list); _i++){
	
	var _array = list[| _i]; //access the i'th element
	//for easier access:
	var _text = _array[UI.TEXT];
	var _range = _array[UI.RANGE];
	var _current = _array[UI.CURRENT];
	var _type = _array[UI.TYPE];
	var _variable = _array[UI.VARIABLE];
	
	//introduce padding
	var _x = x-padding;
	var _y = y + _i * item_height+10 -y_offset;
	draw_set_halign(fa_left);
	//draw_text(x+padding,y+item_height/2,"default pos");
	//draw_text(_x+width-padding,_y+item_height/2,_text);
	draw_text(x+padding,_y+item_height/2-y,_text);
	draw_set_halign(fa_right);
	
	if (ds_list_size(cleanup_list)<ds_list_size(list)+1){
		settings_item(_x+width-padding,_y+item_height/2,_range,_type,_variable,cleanup_list);
	}
	//with(o_toggle){draw_sprite(sprite_index,image_index,x-o_ui_list.x,y-o_ui_list.y);}
	//with(cleanup_list[| _i]){draw_sprite(sprite_index,image_index,x-o_ui_list.x,y-o_ui_list.y);}
	with(cleanup_list[| _i]){
		draw_sprite_ext(sprite_index,image_index,x-o_ui_list.x,y-o_ui_list.y,image_xscale,image_yscale,0,c_white,1);
		draw_text(x-o_ui_list.x+o_ui_list.padding,y-o_ui_list.y,text);
		//print(text + string(_i));
		}
}
surface_reset_target();
draw_surface(menu_surf, x, y);
