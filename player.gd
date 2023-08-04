extends CharacterBody2D
@export var Animated_Sprite : AnimatedSprite2D
@export var SPEED = 125
var input_direction : Vector2

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	elif event.is_action_pressed("ExitPause"):
		set_process_mode(Node.PROCESS_MODE_DISABLED)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta):
	input_direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		Input.get_action_strength("Down") - Input.get_action_strength("Up"),
	)

	velocity = input_direction * SPEED

	move_and_slide()

func TakeDamage(amount):
	
	print("OUCH I GOT HIT BY: ", amount)
	
func Player():
	pass


func _on_firerate_timeout():
	pass # Replace with function body.
