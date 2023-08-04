extends Node2D

## Enter Hitbox area2D
@export var HitBox : Area2D  

## What entitites it can damage
@export_enum("Player", "Enemy", "Both") var CanHit: String

## Damage Amount
@export var Damage: float

var HitBoxEntered = Callable(self, "OnHit")

func _ready():
	print(CanHit)
	HitBox.connect("body_entered", HitBoxEntered)

func _process(delta):
	pass

func OnHit(body):
	if CanHit == "Both" or (CanHit == "Player" and body.has_node("Player")) or (CanHit == "Enemy" and body.has_node("Enemy")):
		if body.has_node("TakeDamage"):
			body.get_node("TakeDamage").TakeDamage(Damage)
