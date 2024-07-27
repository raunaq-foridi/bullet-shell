/// @description 
// You can write your code in this editor

event_inherited();

hp=3;
facing="left"

knockback=15;

function movement_ai(){
	//literal koopa troopa AI lol
	if (stunned<=0){
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
	}
	else{stunned-=1;}
}