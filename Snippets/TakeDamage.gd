extends Node2D

@onready var TakeDMGTimer = $TakeDMG_CD

@export var HealthNode: Node2D
@export var TakeDamageCD: float = 1

var vulnerable: bool = true

func _ready():
	TakeDMGTimer.wait_time = TakeDamageCD

func TakeDamage(amount):
	print("Vulnerable = ", vulnerable)
	if HealthNode.name == "Health":
		if vulnerable:
			vulnerable = false
			TakeDMGTimer.start()
			HealthNode.Health -= amount
	else:
		print("ERROR: Missing Health Node")

func OnDamageTakenCD():
	vulnerable = true
