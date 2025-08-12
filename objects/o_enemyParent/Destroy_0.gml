/// @description Insert description here
// You can write your code in this editor
//var _gears = gears + irandom(bonus_gears);
if (drops ==false){exit}
for (var _val=0;_val<array_length(gear_value);_val++){	//Iterate over elements of gear_value
	var _gears = gears[_val]
	if (bonus_gears!=0){
		_gears =  gears[_val]+irandom(bonus_gears[_val]);
	}
	for (var _i=0;_i<_gears;_i++){
		var _angle =random_range(gear_directions[0],gear_directions[1])
		var _speed =random(gear_strength);
	
		var _gear = instance_create_layer(x,y,layer,o_fallen_gear);
		_gear.vel_x = _speed * cos(_angle);
		_gear.vel_y = _speed * sin(_angle);
		_gear.value = gear_value[_val];
	}
}