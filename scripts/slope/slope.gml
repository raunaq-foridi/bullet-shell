
//Detects how steep a slope is in the direction of motion

function up_slope(){
	var _dy=0;
	while(detect_tile(sign(vel_x),-_dy) !=0){
		_dy+=1;
		if (_dy>=20){break;}
	}
	return _dy
}

function down_slope(){
	var _dy=0;
	while(detect_tile(sign(vel_x),_dy)==0){
		_dy+=1;
		if (_dy>=20){break;}
		return _dy
	}
}