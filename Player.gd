extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400

var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO #(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x += 1 #(1,0)
	if Input.is_action_pressed("move_left"):
		velocity.x = velocity.x - 1
	if Input.is_action_pressed("move_up"):
		velocity.y = velocity.y - 1
	if Input.is_action_pressed("move_down"):
		velocity.y = velocity.y + 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position = position + velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
