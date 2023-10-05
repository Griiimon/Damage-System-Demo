extends Node
class_name HealthComponent

signal report_damage


@export var max_hitpoints: int= 100
@export var invulnerable: bool= false
@export var has_custom_damage_logic: bool= false

@export_category("Damage Types")

@export var whitelist : Array[Damage.Type]
@export var blacklist : Array[Damage.Type]

var hitpoints

func _ready():
	hitpoints= max_hitpoints
	
	if has_custom_damage_logic:
		assert(get_parent().has_method("custom_damage_logic"), get_parent().name + " is missing custom_damage_logic() function")


	
func receive_damage(damage: Damage):
	if invulnerable: return
	
	if damage.type in blacklist: return
	if not whitelist.is_empty() and not damage.type in whitelist:
		return

	var final_damage: int
	
	if has_custom_damage_logic:
		final_damage= get_parent().custom_damage_logic(damage)
	else:
		final_damage= damage.value
	
	hitpoints-= final_damage
	hitpoints= max(hitpoints, 0)
	
	if final_damage == 0: return
	
	report_damage.emit(damage, hitpoints)
	
	if hitpoints <= 0:
		if get_parent().has_method("die"):
			get_parent().die()
		else:
			get_parent().queue_free()

