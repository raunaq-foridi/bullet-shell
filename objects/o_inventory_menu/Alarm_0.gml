/// @description 1 frame delay to close inventory

//update any changes to equipment to the player
o_player.equipment = small_slots;
o_player.occupied = false;
//print(o_player.equipment);
//reset selections and deactivate
selected=-1;
held=-1;
instance_deactivate_object(id);
