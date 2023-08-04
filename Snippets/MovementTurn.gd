extends Node2D
##Turns sprite to match velocity direction

@export var Character_Body: CharacterBody2D
@export var Animated_Sprite: AnimatedSprite2D
@export var IdleAniName: String
@export var MovementAniName: String
func _physics_process(_delta):
	if not Character_Body.velocity == Vector2(0,0):
		Animated_Sprite.play(MovementAniName)
		if not Character_Body.velocity.x == 0:
			if not Character_Body.velocity.x >= 1:
				Animated_Sprite.flip_h = true
			else:
				Animated_Sprite.flip_h = false
	else:
		Animated_Sprite.play(IdleAniName)
