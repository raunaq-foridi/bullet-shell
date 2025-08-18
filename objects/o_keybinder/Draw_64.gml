/// @description Insert description here
// You can write your code in this editor
if (hovering){
	if(listening){image_index=KEYBINDER_SPRITES.LISTENING;}
	else{image_index=KEYBINDER_SPRITES.HOVERED;}
}
else{image_index=KEYBINDER_SPRITES.OFF;}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(not array_contains(exceptions,assigned_key)){
	draw_text(x,y,key_name);	
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

