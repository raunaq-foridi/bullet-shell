/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(o_player)<30){
	image_index=1;	
	o_manager.room_persist_struct={};
	o_player.recent_checkpoint=room;	//later, change to specify, in case multiple checkpoints per room

}
else{
	image_index=0;
}