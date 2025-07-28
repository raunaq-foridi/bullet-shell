// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function speak_dialogue(_text,_text_delay,_voice=snd_type,_name="",){
	var _dialogue = instance_create_layer(x,y,"Instances",o_dialogue_box);
	with(_dialogue){
		if(typeof(other.text)=="string"){other.text=[other.text];}
		text = other.text;
		name = other.name;
		text_delay = other.text_delay;
		voice = other.voice;
	}
}

function next_dialogue(_dialogue){
	//print(_dialogue.name);
	//Creates the next part of dialogue, referring to a pre-created dialogue struct
	
	//If _dialogue is a string, assume it is an accessor from global.dialogue
	
	if (typeof(_dialogue) == "string"){
		var _next = variable_clone( global.dialogue); //inefficient, but :(
		var _accessors = string_split(_dialogue,".");
		for (var _i=0; _i<array_length(_accessors);_i++){
			_next = _next[$ _accessors[_i]];
		}
		_dialogue = _next;
	}
	//deal with undefined variables, set default values
	if(not variable_struct_exists(_dialogue,"name")){_dialogue.name=""}
	if(not variable_struct_exists(_dialogue,"type")){_dialogue.type="dialogue"}
	if(not variable_struct_exists(_dialogue,"voice")){_dialogue.voice=snd_type}
	if(not variable_struct_exists(_dialogue,"next")){_dialogue.next=0}
	if(not variable_struct_exists(_dialogue,"header")){_dialogue.header=""}
	if(not variable_struct_exists(_dialogue,"end_function")){_dialogue.end_function = [print,["dialogue done"]]}
	if(not variable_struct_exists(_dialogue,"text_delay")){_dialogue.text_delay=1}
	
	//Deal with Dialogue:
	if( _dialogue.type=="dialogue"){
		var _speech = instance_create_layer(x,y,"Instances",o_dialogue_box);
		with(_speech){
			if(typeof(_dialogue.text)=="string"){_dialogue.text=[_dialogue.text];}
			if(_dialogue.next!=0){continuing_dialogue=true;}
			else{continuing_dialogue=false;}
			text = _dialogue.text;
			name = _dialogue.name;
			text_delay = _dialogue.text_delay;
			voice = _dialogue.voice;
			//If end_function is defined, it takes priority over next dialogue and ends the speech.
			end_function = _dialogue.end_function;
			if(variable_struct_exists(_dialogue,end_function)){
				end_function = _dialogue.end_function
				print("end func set");
			}
			else if(_dialogue.next!=0){
				//var _next = variable_struct_get(dialogue,_dialogue.next);
				
				//Long day. Access dialogue.x.y.z via looping. I pray this works.
				var _accessors = string_split(_dialogue.next,".");
				//print(_accessors);
				var _next = variable_clone(global.dialogue); //inefficient, but :(
				for (var _i=0; _i<array_length(_accessors);_i++){
					print(_accessors[_i]);
					_next = _next[$ _accessors[_i]];
				}
				end_function=[next_dialogue,[_next]];
				print(_next);
			}
		}	
	}
	//Deal with Questions:
	else if(_dialogue.type=="question"){
		var _question = instance_create_layer(x,y,"Instances",o_question_box);	
		with(_question){
			if(_dialogue.next!=0){continuing_dialogue=true;}
			else{continuing_dialogue=false;}
			header = _dialogue.header;
			text = _dialogue.text;
			functions = _dialogue.functions;
		}
	}
}

//This will later be in a giant text file or something. But this is a good place for now.
/*dialogue = {
	Jimminy:{
		question:"I'm pissed"
	}
};*/

dialogue = {
	
	Jimminy:{
		first_dialogue:{
			type:"dialogue",
			text: ["Hello, This is a Jimminy.","I am able to ask questions, hopefully"],
			name: "Jimminy",
			voice: snd_sword,
			next: "Jimminy.question"
		},
		question:{
			type:"question",
			header:"How are you doing?",
			text:["Pretty good!","I hate Jimminy."],
			functions:[[next_dialogue,"Jimminy.accept"],[next_dialogue,"Jimminy.deny"] ],
			next: 1
			//functions: [[print,[":("]],[print,["depressing"]]]
		},
		accept:{
			type:"dialogue",
			text: ["I am glad to hear it.","Dialogue should end now."],
			name: "Jimminy",
			voice: snd_sword,
			next: 0
		},
		deny:{
			type:"dialogue",
			text: "Well thats not very nice.",
			name: "Angry Jimminy",
			voice: snd_type,
			//Cant use x,y or refer to objects here.
			end_function: [instance_create_layer,[545,200,"Instances",o_enemy2]]
		}
		
		
	}
}