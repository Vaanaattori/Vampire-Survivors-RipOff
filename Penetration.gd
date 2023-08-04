extends Node2D

@export var HitBox : Area2D  

#@export_enum("Player", "Enemy", "Both") var CanPenetrate: String

@export var PenCount: int = 1

var HitBoxEntered = Callable(self, "OnHit")
var Penetrated: int = -1

func _ready():
	if HitBox:
		HitBox.connect("body_entered", HitBoxEntered)

func _process(delta):
	pass

func OnHit(body):
	Penetrated += 1
	if Penetrated >= PenCount:
		get_parent().queue_free()
