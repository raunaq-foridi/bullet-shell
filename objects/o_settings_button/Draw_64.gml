/// @description Insert description here
// You can write your code in this editor

image_xscale = 4.5;
image_yscale = 1.5;
x=620;
y=290;
//draw_sprite(s_restart_button,0,650,300);
draw_self();
//draw_sprite_ext(s_restart_button,image_index,650,300,4.5,1.5,0,c_white,1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(650,300,"Settings",4,4,0);