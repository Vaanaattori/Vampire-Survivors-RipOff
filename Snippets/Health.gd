extends Node2D

@export var Health: float = 100
@export var RegenAmount: float = 1
@export var RegenCDTime: float = 2


@onready var regen_cd = $RegenCD
@onready var MaxHealth = Health
@onready var healthcheck = Health


var Regenerate:bool = true


func _ready():
	regen_cd.wait_time = RegenCDTime

func _process(delta):
	if  Health < healthcheck:
		DamageTaken()
		healthcheck = Health 
	else:
		if Regenerate:
			if Health < MaxHealth:
				Health += RegenAmount * delta
			else:
				Health = MaxHealth

	if Health <= 0 and get_parent().name == "Player":
		get_tree().quit()
	elif Health <= 0 and get_parent().name == "Enemy":
		get_parent().queue_free()

func DamageTaken():
	Regenerate = false
	print("takeDamage")
	regen_cd.start()

func RegenTimeout():
	Regenerate = true
