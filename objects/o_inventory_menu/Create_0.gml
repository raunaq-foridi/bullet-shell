/// @description Insert description here
// You can write your code in this editor
depth = 100;

//positioning
width = 700;	//NOT arbitrary this time.
height= 400;


padding_x=100;
padding_y=100;

//padding
item_height = 50;	//how spaced out items are on y axis
item_width = 50
item_size = item_height;	//just in case.
//padding = 50;		//space between list and edge. Redacted bc the name is too vague
item_padding=5;

//Shape of inventory items
list_width=10;
list_height=3;
//The product of these should be greater than inventory size

//Size and position of inventory
inv_x_pos=padding_x;	
inv_y_pos=view_hport[0]/2;
inv_width=view_wport[0]-2*padding_x;
inv_height=280;

//
inv_padding = 10;


/*list = ds_list_create();
cleanup_list=ds_list_create()*/
item_scaling=0.8

bg_sprite=-1;
inv_sprite=-1;
slot_sprite=-1;

selected = -1;
held= -1;

//Equipment
//code will assume 2 small, 1 large. Modify as needed, but for now this wont auto-adjust.
small_slots=[0,0];
large_slots=[0];

small_slot_radius=50;
instance_deactivate_object(id);

//keyboard vs mouse
mousing=false;