/// @description Insert description here

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
draw_text_ext_transformed(x+text_padding,y+text_padding,text[dialogue],15,(width-2*text_padding)/scale,scale,scale,0);