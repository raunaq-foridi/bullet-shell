/// @description Insert description here
// You can write your code in this editor
/*draw_set_halign(fa_right);
with(o_ui_list){
	if (!surface_exists(menu_surf))
	{
	    menu_surf = surface_create(width, height);
	}
}
surface_set_target(o_ui_list.menu_surf);
//draw_clear_alpha(c_black, 0);

draw_text(x+48-o_ui_list.x,y-o_ui_list.y,values[current]);
draw_self();
surface_reset_target();
*/
//draw_self();
text=values[current];
if(not hovering){image_index=0}
else{image_index=1}