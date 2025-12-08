//Scripts for creating hitboxes

function player_hitbox(_rel_x,_rel_y,_width,_height,_lifespan,_shape="box",_delay=0,_follow_player=false,_vel_x=0,_vel_y=0,_knockback=5,_contact_disable=0,_iframes=20,_freeze=0){
	//Create a hitbox for a player attack
	var _hitbox = instance_create_layer(o_player.x+_rel_x,o_player.y+_rel_y,"Instances",o_player_hitbox);
	
	with(_hitbox){
		rel_x = _rel_x;
		rel_y = _rel_y;
		width = _width;
		height= _height;
		lifespan=_lifespan + _delay;
		follow_player= _follow_player;
		vel_x = _vel_x;
		vel_y = _vel_y;
		shape = _shape;
		delay = _delay;
		freeze = _freeze;
		knockback=_knockback;
		applied_iframes=_iframes;
		contact_disable=_contact_disable;
		
		alarm[1] = lifespan;

		switch(shape){
			case "box":
				sprite_index = s_hitbox_square;
			break
			case "circle":
				sprite_index = s_hitbox_circle;
			break
			default:
				sprite_index = s_hitbox_square;
			break
		}

		image_xscale = width/sprite_width;
		image_yscale = height/sprite_height;
		
		if (delay>0){
			alarm[0]=delay;
			visible=false;		//technically, all will be invisible, but this is just useful for development
			waiting=true;
			//lifespan+=delay;
		}

	}

}

//simplified functions to reduce parametersz
function p_box_hitbox(_x1,_y1,_x2,_y2,_lifespan,_delay=0,_knockback=5,_contact_disable=0,_iframes=20,_freeze=0){
	var _centre = [(_x1+_x2)/2,(_y1+_y2)/2];
	var _width = abs(_x2-_x1);
	var _height= abs(_y2-_y1);
	
	player_hitbox(_centre[0],_centre[1],_width,_height,_lifespan,"box",_delay,true,0,0,_knockback,_contact_disable,_iframes,_freeze)
}

function hitfreeze(_time){
	//Warning: Freezes the ENTIRE game. Use with caution.
	var _t = current_time;
	while (current_time<_t+_time){ };
	
}