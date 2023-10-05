extends Entity
class_name Player

@onready var hitpoints_label = $CanvasLayer/HitpointsLabel

var has_armor: bool= false

func _physics_process(delta):
	
	var movement_dir: Vector2= Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	movement(movement_dir, delta)

	if Input.is_action_just_pressed("ui_select"):
		attack()


func custom_damage_logic(damage: Damage):
	if has_armor and damage.type == Damage.Type.MELEE:
		return damage.value / 2
	return damage.value

func take_damage(_damage: Damage, hitpoints: int):
	super(_damage, hitpoints)
	hitpoints_changed(hitpoints)

func hitpoints_changed(hp: int):
	hitpoints_label.text= "HP: " + str(hp)

func die():
	$Sprite.frame= 1
	disable_player.call_deferred()

func disable_player():
	process_mode= Node.PROCESS_MODE_DISABLED
	await get_tree().create_timer(1).timeout
	queue_free()
	get_parent().respawn_player()

func pickup_armor():
	has_armor= true
	$SpriteArmor.show()
