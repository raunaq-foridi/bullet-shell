/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
scale = [image_xscale,image_yscale];

function animation(){
	
	
	//HIT
	if (hit){
		sprite_index = s_worm_hit;
		alarm[5] = image_number;
		hit = false;
	}
	if (alarm[5]>=0){
		//sprite_index = s_worm_hit;	
		return
	}
	//IDLE
	sprite_index=s_worm_idle;
	
	//MOVEMENT
	if (facing="right"){
		sprite_index = s_worm_run
		image_xscale = scale[0];
	}
	else if(facing="left"){
		sprite_index = s_worm_run
		image_xscale = -scale[0];
	}
	
	

	//alarm[5] = image_number;
	
	
}

facing="left"

function movement_ai(){
	//Walk and pause sometimes.
	var _r = random_range(0,20);
	if (_r>19){
		stunned=_r;
		vel_x=0;
	}
	if (stunned<=0){
		
		if (facing="left"){
			vel_x=-1;
		}
		else{
			vel_x=1;}

		if(not detect_tile(-70,2) and facing="left"){
			var _f = function(_element,_index){instance_destroy(_element);}
			array_foreach(hurtboxes,_f);
			hurtboxes=[];
			make_hurtboxes();
			facing="right";
		}
		else if(not detect_tile(70,2) and facing="right"){
			var _f = function(_element,_index){instance_destroy(_element);}
			array_foreach(hurtboxes,_f);
			hurtboxes=[];
			make_hurtboxes();
			facing="left";
		}
		
	}
	
	else{stunned-=1;}
}

//Hurtboxes
destroy_hitboxes();

hurtboxes = [];
function make_hurtboxes(){
	var _r = 1;
	if (facing=="right"){_r=1;}
	else{_r=-1;}
	
	var _sx = scale[0];
	var _sy = scale[1];
	array_push(hurtboxes, enemy_hurtbox(0*_r*_sx,21*_sy,48*_sx,14*_sy));
	array_push(hurtboxes, enemy_hurtbox(-16*_r*_sx,10*_sy,24*_sx,25*_sy));
	
}
