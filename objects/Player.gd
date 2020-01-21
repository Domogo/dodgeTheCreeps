extends Area2D

signal hit

export var speed = 800 # speed of player (pixels per sec)
var screen_size
var target = position
var prev_target

func _ready():
	screen_size = get_viewport_rect().size
	hide() # hide the player when the game starts

func _process(delta):
	var velocity = Vector2() # the player's movement vector
	prev_target = target
	if InputEventScreenDrag:
		target = get_canvas_transform().xform_inv(get_global_mouse_position())
	if target != prev_target:
		velocity = (target - position).normalized() * speed
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	hide() # player disappear after being hit
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
