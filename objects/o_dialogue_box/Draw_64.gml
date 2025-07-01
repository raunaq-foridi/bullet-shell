/// @description Insert description here
if (name_sprite==-1 and name!=""){
	
	draw_set_alpha(0.9);
	draw_set_color(c_gray);
	draw_roundrect(x,y,x+string_width(name)+2,y-string_height(name)-2,false);
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	draw_roundrect(x,y,x+string_width(name)+2,y-string_height(name)-2,true);
	
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_text(x+1,y-1,name);
	draw_set_valign(fa_top);
	draw_set_color(-1);
}
if (sprite==-1){
	//if no sprite is set
	draw_set_alpha(0.9);
	draw_set_color(c_gray);
	draw_roundrect(x,y,x+width,y+height,false);
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	draw_roundrect(x,y,x+width,y+height,true);
}
else{
	//later populate with sprite equivalent
	print("AAAAAAAAA");
}
//draw_text(x+text_padding,y+text_padding,text);
//draw_text_ext(x+text_padding,y+text_padding,text[dialogue],15,width-2*text_padding);
var _x = 0;
if(talk_sprite!=-1){
	_x=sprite_get_width(talk_sprite);
	draw_sprite(talk_sprite,-1,x+ text_padding,y+text_padding);
}
var _text_delay = text_delay/global.text_speed;
var _letter_pos = floor(letter_pos/_text_delay);
var _text = string_copy(text[dialogue],1,_letter_pos);
draw_text_ext_transformed(x+text_padding+_x,y+text_padding,_text,15,(width-2*text_padding-_x)/scale,scale,scale,0);