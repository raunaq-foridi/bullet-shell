/// @description Insert description here
// You can write your code in this editor
visible=false;
attacking=false;
recharging=false;


cooldown=15;
attack_duration=10;
combo = false;

stun=25;	//how long an enemy will be stunned for [set to 0 to remove]
knockback=5;	//deal knockback in direction opposite to player. 

player_facing = 1;	//1 for right, -1 for left.

player_sprite = s_player_idle;		//during attacks, replace this with the appropriate attack sprite

function basic_attack_setup(_duration,_cooldown,_input_window,_next_state,_sprite,_anim_speed){
	//handles everything about the attack besides the hitboxes
	player_sprite = _sprite;
	o_player.attack_state=_next_state;
	alarm[1]=_duration;
	alarm[2]=_cooldown;
	alarm[3]=_input_window;
	image_speed = _anim_speed;
		
	combo=true;
}
function neutral(){
	var _state = o_player.attack_state;
	
	//variable initialisation
	
	var _duration;		//How long before the next attack can be started
						//Changed to: How long does the animation play for?
						
	var _cooldown;		//How long until the next attack can start?
	
	var _end_lag;		//If the combo ends, how long is the cooldown? Unused
	
	var _input_window;	//How long to input next attack before the combo ends itself
	var _anim_speed=1;
	
	//3 part Combo - Attack 1
	if (_state==0){
		
		_duration = 30;
		_cooldown = 15;
		_input_window = 25;
		_anim_speed = 15/60;
		
		/*player_sprite = s_player_neutral_1;
		o_player.attack_state=1;
		alarm[1]=_duration;
		alarm[2]=_cooldown;
		alarm[3]=_input_window;
		_anim_speed = 15/60;
		
		combo=true;*/
		
		//testing refactored version
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_neutral_1,_anim_speed);
		player_hitbox(30*player_facing,20,40,70,attack_duration,"box",0,true);
		player_hitbox(30*player_facing,50,40,20,attack_duration,"circle",3,true);
		
		//Hitbox explanation:
		// (x, y, width, height, lifespan, shape, delay, attached to player, x speed, y speed, knockback, iframes, freeze time)
		//x and y are relative to the players position, and are the hitbox Centre. If attached to player, this distance is maintained
		//x speed, y speed allows the hitbox to move linearly.
		
		//for box hitboxes, there is the simplifed p_box_hitbox() which takes the Corners of the hitbox instead
	}
	//Attack 2
	else if(_state==1){
		_duration = 30;
		_cooldown = 15;
		_input_window = 25;
		_anim_speed = 15/60;
		
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_neutral_2,_anim_speed);
			
		player_hitbox(26*player_facing,10,40,60,attack_duration,"box",3,true);
		player_hitbox(20*player_facing,10,40,20,attack_duration/2,"circle",10,true,-2*player_facing,-2);
		player_hitbox(30*player_facing,50,40,20,attack_duration,"circle",0,true);
	}
	//Attack 3
	else if(_state==2){
		_duration = 30;
		_cooldown = 30;
		_input_window = 30;
		_anim_speed = 15/60;
		
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_neutral_3,_anim_speed);
		
		//player_hitbox(30*player_facing,30,40,40,attack_duration,"box",0,true);
		//player_hitbox(20*player_facing,10,40,20,attack_duration,"circle",10,true);
		
		/*player_hitbox(50*player_facing,10,70,80,attack_duration,"box",0,true);
		player_hitbox(20*player_facing,30,140,36,attack_duration,"box",4,true);*/
		
		//Testing out high knockback finish
		player_hitbox(50*player_facing,10,70,80,attack_duration,"box",0,true,,,15,,500);
		player_hitbox(20*player_facing,30,140,36,attack_duration,"box",4,true,,,15,,500);
	}
	
	image_speed = _anim_speed;
}

function aerial() {
	var _state = o_player.attack_state;
	
	//variable initialisation
	
	var _duration;		
	var _cooldown;		
	var _input_window;	
	var _anim_speed=1;
	
	if (_state==0){
		
		_duration = 30;
		_cooldown = 15;
		_input_window = 20;
		_anim_speed = 20/60;
		
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_aerial_1,_anim_speed);
		
		player_hitbox(0,30,60,100,attack_duration,"circle",3,true);
		
	}
	
	image_speed = _anim_speed;
	
}

function forward(){
	var _state = o_player.attack_state;
	
	//variable initialisation
	
	var _duration;		
	var _cooldown;		
	var _input_window;	
	var _anim_speed=1;
	
	if (_state==0){
		
		_duration = 30;
		_cooldown = 15;
		_input_window = 20;
		_anim_speed = 45/60;
		
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_forward,_anim_speed);
		
		player_hitbox(0,30,100,80,attack_duration,"circle",3,true);
		
	}
	
	image_speed = _anim_speed;	
}

function up(){
	var _state = o_player.attack_state;
	
	//variable initialisation
	
	var _duration;	
	var _cooldown;		
	var _input_window;	
	var _anim_speed=1;
	
	if (_state==0){
		
		_duration = 15;
		_cooldown = 15;
		_input_window = 20;
		_anim_speed = 30/60;
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_up_1,_anim_speed);
		player_hitbox(0,0,60,60,attack_duration,"circle",3,true);
		
	}
	else if (_state==1){
		
		_duration = 15;
		_cooldown = 15;
		_input_window = 20;
		_anim_speed = 20/60;
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_up_2,_anim_speed);
		player_hitbox(0,0,60,60,attack_duration,"circle",0,true);
		
	}
	
	image_speed = _anim_speed;	
}
function down(){
	var _state = o_player.attack_state;
	
	//variable initialisation
	
	var _duration;		
	var _cooldown;		
	var _input_window;	
	var _anim_speed=1;
	
	if (_state==0){
		
		_duration = 30;
		_cooldown = 15;
		_input_window = 20;
		_anim_speed = 20/60;
		
		basic_attack_setup(_duration,_cooldown,_input_window,_state+1,s_player_down,_anim_speed);
		player_hitbox(20*player_facing,30,60,60,attack_duration,"circle",3,true);
		
	}
	
	image_speed = _anim_speed;	
}
