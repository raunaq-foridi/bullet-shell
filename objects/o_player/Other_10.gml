/// @description Player Death

o_manager.gears -=10;
if (o_manager.gears<0){o_manager.gears=0;}

teleporting=true;
//print(recent_checkpoint);
room_restart();
room_goto(recent_checkpoint);