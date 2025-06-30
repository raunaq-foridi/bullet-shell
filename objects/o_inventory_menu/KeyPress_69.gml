/// @description Insert description here
// You can write your code in this editor

//update any changes to equipment to the player
o_player.equipment = small_slots;
print(o_player.equipment);
//reset selections and deactivate
selected=-1;
held=-1;
instance_deactivate_object(id);