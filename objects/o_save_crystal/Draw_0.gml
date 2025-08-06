/// @description Insert description here
// You can write your code in this editor
var _osc = sin(degtorad(timer)) * bounce_range;
draw_sprite(sprite_index,image_index,start_x,start_y + _osc);

if(closest and within_range){
	draw_sprite(interaction_sprite,-1,x,y-10);	
}