/// @description Insert description here
// You can write your code in this editor
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
draw_text_ext_transformed(x+ text_padding,y+text_padding,header,15,(width-2*text_padding)/scale,scale,scale,0);	
for(var _i=0; _i<array_length(text);_i++;){
	var _text = text[_i];
	if( _i==selection){ _text = "> "+_text;}
	var _x = x+text_padding
	var _y = y+text_padding + 30*_i + 30
	draw_text_ext_transformed(_x,_y,_text,15,(width-2*text_padding)/scale,scale,scale,0);	
	
}