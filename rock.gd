extends Node2D

@export var BulletSprite : Sprite2D
@export var projectile_speed = 150

var vel

func _physics_process(delta):
	if projectile_speed != null:
		BulletSprite.rotate(delta * (projectile_speed / 7))
		if vel:
			move_local_x(vel * delta * 10)
		else:
			move_local_x(delta * projectile_speed)

func shot():
	top_level = true
