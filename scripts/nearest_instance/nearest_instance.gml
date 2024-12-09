// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Checks for the nth nearest instance of an object being interracted with at relative pos _x,_y
//specifically behaves identically to furthest_instance if _dist is set to -1


function nearest_instance(_object,_dist,_x,_y){
	
	//default values
	if(is_undefined(_x)){_x=0;}
	if(is_undefined(_y)){_y=1;}
	if(is_undefined(_dist)){_dist=0;}
	var _instance =0;
	if(place_meeting(x+_x,y+_y,_object)){ // and (abs(x-o_platform.x)<o_platform.clamp_x)
		var _instanceList = ds_list_create();
		instance_place_list(x+_x,y+_y,_object,_instanceList,true); //ordered list of objects intersecting one pixel below
		
		if(_dist<0){_dist=ds_list_size(_instanceList)-_dist;}		//if negative, wrap to nth furthest.
		
		_instance = ds_list_find_value(_instanceList,_dist);	//take nth closest object
		ds_list_destroy(_instanceList);	//memory purposes
	}
	return _instance
}