//Scripts for creating hitboxes

function player_hitbox(_rel_x,_rel_y,_width,_height,_lifespan,_shape="box",_delay=0,_follow_player=false,_vel_x=0,_vel_y=0){
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