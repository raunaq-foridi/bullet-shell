/// @description deal with directional input

//KEYBOARD CENTRIC CODE
//ADD CONTROLLER SUPPORT LATER

//Keyboard events WASD will deal with placement on a grid
//however, we soon wish to replace Keyboard events to allow rebinding

if(enabled == false){
	//print("keyblocked");
	exit
	}

//Left

if (keyboard_check_pressed(global.keys.move_left)){
	
	var _grid_width = ds_grid_width(keyboard_grid);
	//var _grid_height = ds_grid_height(keyboard_grid);

	for (var _i=0; _i<_grid_width; _i++){
	
		keyboard_pos[0]-=1;
		keyboard_pos[0]+=_grid_width;
		keyboard_pos[0]%=_grid_width;
		if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
	}

	print(keyboard_pos);
}
	
//Right

if (keyboard_check_pressed(global.keys.move_right)){
	var _grid_width = ds_grid_width(keyboard_grid);
	//var _grid_height = ds_grid_height(keyboard_grid);

	for (var _i=0; _i<_grid_width; _i++){
	
		keyboard_pos[0]+=1;
		keyboard_pos[0]%=_grid_width;
		if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
	}

	print(keyboard_pos);
}
	
//Up

if (keyboard_check_pressed(global.keys.move_up)){
	
	var _grid_width = ds_grid_width(keyboard_grid);
	var _grid_height = ds_grid_height(keyboard_grid);

	for (var _i=0; _i<_grid_height; _i++){
	
		keyboard_pos[1]-=1;
		keyboard_pos[1]+=_grid_height;
		keyboard_pos[1]%=_grid_height;
		if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
		else{
			if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==0){continue}
			if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] <0.5){
				print("less");
				for (var _j=0; _j<_grid_width; _j++){
	
					keyboard_pos[0]-=1;
					keyboard_pos[0]+=_grid_width;
					keyboard_pos[0]%=_grid_width;
					if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
				}
			}
			else if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] >=0.5){
				print("moar");
				for (var _j=0; _j<_grid_width; _j++){
	
					keyboard_pos[0]+=1;
					keyboard_pos[0]+=_grid_width;
					keyboard_pos[0]%=_grid_width;
					if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
				}
			}
			break
		}
	}

	print(keyboard_pos);
}

//Down

if (keyboard_check_pressed(global.keys.move_down)){
	
	var _grid_width = ds_grid_width(keyboard_grid);
	var _grid_height = ds_grid_height(keyboard_grid);

	for (var _i=0; _i<_grid_height; _i++){
	
		keyboard_pos[1]+=1;
		keyboard_pos[1]%=_grid_height;
		if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
		else{
			if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==0){continue}
			if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] <0.5){
				for (var _j=0; _j<_grid_width; _j++){
	
					keyboard_pos[0]-=1;
					keyboard_pos[0]+=_grid_width;
					keyboard_pos[0]%=_grid_width;
					if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
				}
			}
			else if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] >=0.5){
				for (var _j=0; _j<_grid_width; _j++){
	
					keyboard_pos[0]+=1;
					keyboard_pos[0]+=_grid_width;
					keyboard_pos[0]%=_grid_width;
					if(keyboard_grid[# keyboard_pos[0],keyboard_pos[1]] ==1){break}
				}
			}
			break
		}
	}


	print(keyboard_pos);
}