class_name BleedingData
extends Resource

enum BleedingType{ELEMENTAL, ENGINEERING}

export (float) var chance: = 0.0
export (float) var damage: = 1.0
export (int) var duration: = 200
export (BleedingType) var type: = BurningType.ELEMENTAL


func _init(p_chance:float = 0.0, p_damage:float = 1.0, p_duration:int = 200, p_type:int = 0)->void :
	type = p_type
	chance = p_chance
	damage = p_damage
	duration = p_duration


func serialize()->Dictionary:
	return {
		"chance":chance, 
		"damage":damage, 
		"duration":duration, 
	}


func deserialize_and_merge(serialized:Dictionary)->void :
	chance = serialized.chance
	damage = serialized.damage
	duration = serialized.duration as int
