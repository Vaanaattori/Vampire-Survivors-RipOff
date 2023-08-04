extends ProgressBar

@export var HealthNode: Node2D

func _ready():
	max_value = HealthNode.MaxHealth

func _process(delta):
	value = HealthNode.Health
