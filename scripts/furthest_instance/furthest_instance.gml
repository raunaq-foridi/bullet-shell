// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Detects the furthest instance of an object that is being interacted with
//i.e, the one directly beneath your feet, by default


function furthest_instance(_object,_x,_y){
	
	//default values
	if(is_undefined(_x)){_x=0;}
	if(is_undefined(_y)){_y=1;}
	var _instance =0;
	if(place_meeting(x+_x,y+_y,_object)){ // and (abs(x-o_platform.x)<o_platform.clamp_x)
		var _instanceList = ds_list_create();
		instance_place_list(x+_x,y+_y,_object,_instanceList,true); //ordered list of objects intersecting one pixel below
		_instance = ds_list_find_value(_instanceList,ds_list_size(_instanceList)-1);	//take most distant object
		ds_list_destroy(_instanceList);	//memory purposes
	}
	return _instance		//as the name implies, this is an instance, not a real.
}