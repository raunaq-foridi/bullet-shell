/*function set_flag(_flag,_value){
	// function to set the value of a flag. Should be input as a string, e.g, "grasslands.johnathon"
	//Mostly for syntax purposes, when a function is required rather than a statement
	
	//print(_flag);
	var _accessors = string_split(_flag,".");
	//print(_accessors);
	/*var _next = variable_clone(global.dialogue); //inefficient, but :(
	for (var _i=0; _i<array_length(_accessors);_i++){
		//print(_accessors[_i]);
		_next = _next[$ _accessors[_i]];
	}*/
	//Experimental code.
	//Idea: Set _next, reference this by a new variable _temp and dereference next
	//Then, use _temp to take the next iteration of _next, instead of going deeper into itself
	//That way, _next can instead be an ACTUAL reference to the struct, rather than a clone.
	
	/*var _next = global.flag;
	var _temp=0;
	for (var _i=0; _i<array_length(_accessors);_i++){
		//print(_accessors[_i]);
		_temp = _next[$ _accessors[_i]];
		print(_next)
		delete _next;
		//print(_temp);
		_next = _temp;
		
		//delete _temp;
		
	} * /
	var _next = ref_create(global,"flag"); //inefficient, but :(
	var _temp = 0;
	for (var _i=0; _i<array_length(_accessors)-1;_i++){
		//print(_accessors[_i]);
		_temp = ref_create(_next, _accessors[_i]);
		delete _next;
		_next = _temp;
		}
	
	//Hopefully, _next now holds a reference to the exact flag we're interested in
	print(_next);
	_next[$ array_last(_accessors)] = _value;
	//_temp = _value;
	//print(_next);
	print("Hopefully set flag");
}*/

function VarRef(_struct,_varname) constructor {
	//A New method. Object Oriented, create my own "Pointer" as a class, essentially.
	
	struct = _struct;
	varname= _varname;
	
	static get = function(){
		return variable_struct_get(struct,varname)
	}
	static set = function(_value){
		return variable_struct_set(struct,varname,_value);	
	}
}

function set_flag(_flag,_value){
	var _accessors = string_split(_flag,".");
	var _next = new VarRef(global,"flag");
	for (var _i=0; _i<array_length(_accessors);_i++){
		_next = new VarRef(_next.get(),_accessors[_i]);
	}
	print(_next);
	print(_next.get());
	_next.set(_value);
	print(_next.get());
	print("Hopefully set2 flag ",_flag," to be ",_value);
	
}
function get_flag(_flag){
	var _accessors = string_split(_flag,".");
	//var _next = variable_clone(global.flag); //I hope to make this more efficient. eventually.
	var _next = variable_clone(global.flag[$ _accessors[0]]);
	for (var _i=1; _i<array_length(_accessors);_i++){
		//print(_accessors[_i]);
		_next = _next[$ _accessors[_i]];
	}
	print(_flag, "returned as ",_next);
	return _next
}
flag = {
	
	grasslands: {
		johnathon: false,
		jimminy_met: false,
		jimminy_angered: false,
		random_switch: false,
		test: "graaah"
	}
	
};
