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

for (var _i=0; _i<ds_list_size(list); _i++){
	
	var _array = list[| _i]; //access the i'th element
	//for easier access:
	var _text = _array[UI.TEXT];
	var _range = _array[UI.RANGE];
	var _current = _array[UI.CURRENT];
	var _type = _array[UI.TYPE];
	var _variable = _array[UI.VARIABLE];
	
	//introduce padding
	var _x = x+padding;
	var _y = y + _i * item_height;
	draw_set_halign(fa_right);
	draw_text(_x+width-padding,_y,_text);
	draw_set_halign(fa_left);
}

