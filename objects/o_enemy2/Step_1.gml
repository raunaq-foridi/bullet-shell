/// @description Enemy AI

//Enemy AI done in Begin Step
event_inherited();

//literal koopa troopa AI lol

if (facing="left"){
	vel_x=-1;
}
else{
	vel_x=1;}

if(not detect_tile(-2,1) and facing="left"){
	facing="right";
}
else if(not detect_tile(2,1) and facing="right"){
	facing="left";
}