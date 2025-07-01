/// @description Healthbar for now
// You can write your code in this editor
draw_healthbar(1200,20,1300,40,o_player.hp/o_player.max_hp*100,c_grey,c_red,c_green,0,true,true);

//draw_text(1200,40,"gears: "+string(o_manager.gears));
draw_set_color(c_white);
draw_text_ext(1200,40,"gears: "+string(o_manager.gears),0,200);
draw_set_color(-1);