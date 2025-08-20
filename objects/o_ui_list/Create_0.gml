/// @description Default values for a list UI
//For example, a settings menu
depth = 100;

width = 700;	//arbitrary
height= 400;

//padding
item_height = 50;	//how spaced out items are on y axis
padding = 50;		//space between list and right edge

list = ds_list_create();
cleanup_list=ds_list_create()
sprite=-1;
//sprite = s_restart_button;

y_offset=0;
max_scroll=200;

menu_surf=surface_create(width, height);
surface_free(menu_surf);

scrollslot = instance_create_layer(x,y,"Instances",o_scroll_slot);
scrollslot.ui_list = id;

close = instance_create_layer(x,y,"Instances",o_close_button);

other_lists=[];
name="";
alarm[0]=1;

scroll_modifier = 5; //how much is scrolled per frame of scrolling

distance_before_scroll = 550;	//What distance, from the top of the menu, must the current item be before forcing a scroll
upwards_before_scroll = 100;	//What distance from top before scrolling back up?