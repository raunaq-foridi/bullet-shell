/// @description Insert description here
// You can write your code in this editor

//draw_sprite(sprite_index,image_index,16,16);

//draw_sprite(s_all_elements,element,16,16);

var _mana =  mana/max_mana;

//draw_sprite_stretched(s_mana,0,34,60,60*_mana,20);
draw_sprite_ext(s_mana,0,34,60,15*_mana,2,0,c_white,1);

draw_sprite_ext(s_mana_bar,0,34,60,4,2,0,c_white,1);

draw_sprite_ext(sprite_index,image_index,32,32,2,2,0,c_white,1);
draw_sprite_ext(s_all_elements,element,32,32,2,2,0,c_white,1);

