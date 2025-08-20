//Collection of scripts to deal with Controller support
//Should widely replace keyboard_check functions
function gamepad_check(_input){
	//var _gamepad = 0 //"TEMPORARY PLACEHOLDER"
	var _gamepads = o_keyboard_controller.gamepads;
	var _gamepad;
	if (array_length(_gamepads)==0){return 0}
	//_input should be a string, such as move_up, regarding a certain control
	_gamepad = _gamepads[0]
	//print(_input);
	var _button = global.controls[$ _input];
	//print(_button);
	if(is_array(_button)){
		//if(_input=="move_left"){ print(gamepad_axis_value(_gamepad,_button[0]*_button[1]))}
		return gamepad_axis_value(_gamepad,_button[0])*_button[1]
	}
	//no "else" necessary, since if statement ends function
	//hence, assume _button is not an axis but rather actually a button
	
	return gamepad_button_value(_gamepad,_button)
}

function gamepad_check_pressed(_input){
	var _gamepads = o_keyboard_controller.gamepads;
	var _gamepad;
	if (array_length(_gamepads)==0){return 0}
	var _button = global.controls[$ _input]
	_gamepad = _gamepads[0]
	//later put in fancy code to detect if the axis _WAS_ zero
	if(is_array(_button)){
		return gamepad_axis_value(_gamepad,_button[0]*_button[1])
	}
	if (gamepad_button_check_pressed(_gamepad,_button)){print("WOOOOOOO")}
	return gamepad_button_check_pressed(_gamepad,_button);
}
function gamepad_check_released(_input){
	var _gamepads = o_keyboard_controller.gamepads;
	var _gamepad;
	if (array_length(_gamepads)==0){return 0}
	_gamepad = _gamepads[0]
	var _button = global.controls[$ _input]
	//later put in fancy code to detect if the axis _WAS_ one
	if(is_array(_button)){
		return 1 - gamepad_axis_value(_gamepad,_button[0]*_button[1])
	}
	
	return gamepad_button_check_released(_gamepad,_button);
}


function input_check(_input){
	//combine keyboard and gamepad checks
	
	//var _button = global.controls[$ _input];
	var _key = global.keys[$ _input];
	
	var _keycheck = keyboard_check(_key);
	/*if (not gamepad_is_connected(0)){return _keycheck}
	else{print("gamepad detected")}*/
	var _controlcheck = gamepad_check(_input);
	
	return (_keycheck or _controlcheck)
	
}

function input_check_pressed(_input){
	//combine keyboard and gamepad checks
	//print("Is this even running?");
	//var _button = global.controls[$ _input];
	var _key = global.keys[$ _input];
	
	var _keycheck = keyboard_check_pressed(_key);
	//if (not gamepad_is_connected(0)){return _keycheck}
	//else{print("failure.")}
	var _controlcheck = gamepad_check_pressed(_input);
	//print(_controlcheck);
	
	return (_keycheck or _controlcheck)
	
}

function input_check_released(_input){
	//combine keyboard and gamepad checks

	//var _button = global.controls[$ _input];
	var _key = global.keys[$ _input];
	
	var _keycheck = keyboard_check_released(_key);
	//if (not gamepad_is_connected(0)){return _keycheck}
	var _controlcheck = gamepad_check_released(_input);
	
	return (_keycheck or _controlcheck)
	
}