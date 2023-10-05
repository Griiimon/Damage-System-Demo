extends Area2D



func _on_body_entered(body):
	assert(body is Player)
	var player= body as Player
	player.pickup_armor()
	queue_free()
