/// @description Insert description here
// You can write your code in this editor
if (global.mute==true){
	audio_master_gain(0);
}
else{
	audio_master_gain(global.volume);
	
}