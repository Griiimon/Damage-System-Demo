extends Sprite2D

@onready var damage_area = $DamageArea


func _ready():
	enable_damage(false)
	
	
func enable_damage(b: bool):
	damage_area.monitoring= b
