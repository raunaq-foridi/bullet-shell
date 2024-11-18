// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//moves an object by iteratively moving a given number of steps
//and deals with tile collisions
function repeat_move(_move_x,_move_y){
	var _dir_x = sign(_move_x); //"direction", positive or negative x [+1 or -1]
	var _dir_y = sign(_move_y);
	var _mag_x = abs(_move_x);  //"magnitude", How far in the x direction
	var _mag_y = abs(_move_y);  //treated a bit like a vector
	
	//move diagonally (x->y->x->y... staircase) until one direction is done
	for (var _i=0; _i<min(_mag_x,_mag_y); _i++){
		//move one step in x, unless collision
		if (not detect_tile(_dir_x,0)){x+=_dir_x;}
		//move one step in y, unless collision
		if (not detect_tile(0,_dir_y)){
				
				if(place_meeting(x,y+1,o_semiSolid) and _dir_y>0){
					var _semisolid=instance_place(x,y+1,o_semiSolid);
					var _semisolidList = ds_list_create();
					instance_place_list(x,y+1,o_semiSolid,_semisolidList,true);
					var _semisolid2 = ds_list_find_value(_semisolidList,ds_list_size(_semisolidList)-1);
					if(place_meeting(x,y,_semisolid2)){
						y+=_dir_y;
					}
					ds_list_destroy(_semisolidList);
				}
				else{
					y+=_dir_y;}
		//if (not detect_tile(0,_dir_y)){
		//	if (_dir_y<0 or not place_meeting(x,y+1,o_semiSolid)){
		//		y+=_dir_y;
		//	}
			
		}
	}
	//At this point all x or y motion is complete; move straight in the remaining direction
	if (_mag_x>_mag_y){
		repeat(_mag_x-_mag_y){
			if (not detect_tile(_dir_x,0)){x+=_dir_x;}	//move in x until done
		}
	}
	else{
		repeat(_mag_y-_mag_x){
			if (not detect_tile(0,_dir_y)){
				
				if(place_meeting(x,y+1,o_semiSolid) and _dir_y>0){
					var _semisolid=instance_place(x,y+1,o_semiSolid);
					var _semisolidList = ds_list_create();
					instance_place_list(x,y+1,o_semiSolid,_semisolidList,true);
					var _semisolid2 = ds_list_find_value(_semisolidList,ds_list_size(_semisolidList)-1);
					if(place_meeting(x,y,_semisolid2)){
						y+=_dir_y;
					}
					ds_list_destroy(_semisolidList);
				}
				else{
					y+=_dir_y;}
				//if (_dir_y<0 or not place_meeting(x,y+1,o_semiSolid)){
				//	y+=_dir_y;
				//}

			}
			//move in y until done
		}
	}
}