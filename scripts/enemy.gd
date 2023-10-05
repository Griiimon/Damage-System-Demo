extends Entity


func _ready():
	super()
	last_horizontal_dir= -1

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		attack()
