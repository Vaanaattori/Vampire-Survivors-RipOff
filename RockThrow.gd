extends Node2D

@export var LoadBulletType: PackedScene = preload("res://rock.tscn")
@export var Player: CharacterBody2D

@export var FireRate: float = 1
@export var Damage: float = 1

@onready var FireRateTimer = $FireRate

func _ready():
	FireRateTimer.wait_time = FireRate

func _on_firerate_timeout():
	var Bullet = LoadBulletType.instantiate()
	if Bullet:
		add_child(Bullet)
		Bullet.get_node("DealDamage").CanHit = "Enemy"
		Bullet.projectile_speed *= 2
		Bullet.look_at(get_global_mouse_position())
		Bullet.position = global_transform.origin
		Bullet.shot()
		print("bullet shot")
	else:
		print("ERROR: Bullet not found")
