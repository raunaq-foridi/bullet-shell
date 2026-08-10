/// @description 

enum ELEMENTS{
	
	FIRE,
	WATER,
	AIR
	
}

element = ELEMENTS.FIRE;

mana = 100;
max_mana=100;

mana_system = "time"		//"none", "time" or "vampire"


//image_speed=0;

function use_magic(){
	if (mana<=1){return;}
	switch (element){
		case ELEMENTS.FIRE:
		break;
		
		case ELEMENTS.WATER:
			if(not instance_exists(o_water_orb)){
				instance_create_layer(x,y,"Instances",o_water_orb);	
			}
		
		case ELEMENTS.AIR:
		break;
		
	}
	
}