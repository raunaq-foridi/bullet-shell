/// @description Insert description here
// You can write your code in this editor
instance_activate_object(o_inventory_menu);
if (not instance_exists(o_inventory_menu)){
	instance_create_layer(x,y,"Instances",o_inventory_menu);
	instance_activate_object(o_inventory_menu);
}
o_inventory_menu.small_slots=o_player.equipment;
//print ("Arghahghgaghagh");