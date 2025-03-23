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

y_offset=0;
max_scroll=1000;

menu_surf=surface_create(width, height);
surface_free(menu_surf);