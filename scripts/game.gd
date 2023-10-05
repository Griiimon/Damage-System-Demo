extends Node2D

@onready var Player= preload("res://scenes/player.tscn")

var player_spawn: Vector2

func _ready():
	player_spawn= $Player.global_position

func respawn_player():
	await get_tree().create_timer(1).timeout
	var player= Player.instantiate()
	player.position= player_spawn
	add_child(player)
