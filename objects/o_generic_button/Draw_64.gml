/// @description Insert description here
// You can write your code in this editor
image_xscale = width;
image_yscale = height;
//x=620;
//y=190;

if(not skip_draw){
	draw_self();
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(x+30,y+10,text,4,4,0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(-1);
}