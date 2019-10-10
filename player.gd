extends Area2D

export (int) var speed
var screensize

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2();
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
		
	if velocity.length() >0:
		velocity = velocity.normalized() * speed
		#$player.play()
		get_node("AnimatedSprite").play();
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x,0,screensize.x)
	position.y = clamp(position.y,0,screensize.y)
		