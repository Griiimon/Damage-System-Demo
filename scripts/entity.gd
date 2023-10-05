extends CharacterBody2D
class_name Entity


@export var speed: float= 50.0

@onready var weapon_node: Node2D = $Weapon

var last_horizontal_dir: int= 0

func _ready():
	if weapon_node.get_child_count() > 0:
		weapon_node.get_child(0).hide()

func take_damage(_damage: Damage, hitpoints: int):
	play_damage_effect()

func play_damage_effect():
	var tween = get_tree().create_tween()
	modulate= Color.WHITE
	tween.tween_property($Sprite, "modulate", Color.RED, 0.2)
	tween.tween_property($Sprite, "modulate", Color.WHITE, 0.2)


func movement(dir: Vector2, _delta):
	velocity= dir * speed
	
	if velocity.x != 0:
		last_horizontal_dir= int(sign(velocity.x))
	
	move_and_slide()


func attack():
	var dir= last_horizontal_dir
	if dir == 0: dir= 1
	
	if  dir == 1:
		weapon_node.rotation_degrees= 0
	else:
		weapon_node.rotation_degrees= 180
	
	var weapon= weapon_node.get_child(0)
	weapon.enable_damage(true)
	weapon.show()

	weapon.position= Vector2(1, 0) * 10
	var tween = get_tree().create_tween()
	tween.tween_property(weapon_node, "position", Vector2(dir, 0) * 30, 0.3)
	tween.tween_property(weapon_node, "position", Vector2.ZERO * 30, 0.1)
	tween.tween_callback(deactivate_weapon)


func deactivate_weapon():
	var weapon= weapon_node.get_child(0)
	weapon.enable_damage(false)
	weapon.hide()
