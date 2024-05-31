extends CharacterBody2D

const speed = 500
const jump_power = -2000

const acc = 50
const friction = 70

const grav = 120

const max_jumps = 2
var curent_jumps = 1

#physics loop
#//
func _physics_process(delta):
	var input_dir : Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
	
		# // moving animation here//

	else :
		add_friction()
		
		# // idel animation here//
		
	player_move()
	jump()
# // 

#functions 
#//
func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir = input_dir.normalized()
	return input_dir

func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)
func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)
	
func player_move():
	move_and_slide()

func play_animation():
	#animation script here
	pass

func jump():
	if Input.is_action_just_pressed("ui_up"):
		if curent_jumps < max_jumps:
			velocity.y = jump_power
			curent_jumps += 1
	else:
		velocity.y += grav
		
	if is_on_floor():
		curent_jumps = 1
		
		
