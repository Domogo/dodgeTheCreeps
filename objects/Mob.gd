extends RigidBody2D

export var min_speed = 150 # minimum speed range
export var max_speed = 250 # maximum speed range
var mob_types = ["walk", "swim", "fly"]


func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]


func _on_Visibility_screen_exited():
	queue_free()


# on game start erase old mobs
func _on_start_game():
	queue_free()
