extends Node2D

@onready var navagent = $NavigationAgent2D
@export var CharacterBody = CharacterBody2D
@export var speed: int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	navagent.set_target_position(Global.Player.global_transform.origin)
	var next_nav_point = navagent.get_next_path_position()
	CharacterBody.velocity = (next_nav_point - CharacterBody.global_transform.origin).normalized() * speed
