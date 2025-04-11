extends CharacterBody2D

@export var run_speed = 500
@export var gravity = 700.0
@export var jump_speed = -600
@onready var sprite_2d = $AnimatedSprite2D
@onready var text_2d = $RichTextLabel

var database = ["Terms Found: "]  # Example list with a "word" element
	
# You can add a method to get the database if needed
func get_database() -> Array:
	return database

func set_database(word: String) -> void:
	if word not in database:
		database.append(word)
		print("Added to database:", word)

func _physics_process(delta):
	
	velocity.y += gravity * delta  
	
	#if Input.is_key_pressed(KEY_Y):
		#var text_output = "Terms Found: " 
		#for word in get_database():
			#if word != "word" and word != "Terms Found: ":
				#word = word.to_upper()
				#text_output += word + " - "
		#text_2d.text = text_output
		#text_2d.visible = true
	#elif Input.is_key_pressed(KEY_Z):
		#text_2d.visible = false
	
	if Global.stop_move == true:
		velocity.x = 0
		velocity.y = 0
		sprite_2d.animation = "idle"
	else:
		if is_on_floor() == false:
			sprite_2d.animation = "jump"
			if Input.is_action_pressed("ui_left"):
				velocity.x = -run_speed
				sprite_2d.flip_h = true
			elif Input.is_action_pressed("ui_right"):
				velocity.x = run_speed
				sprite_2d.flip_h = false
		
		else:
			if Input.is_action_just_pressed('ui_up'):
				velocity.y = jump_speed
				sprite_2d.animation = "jump"

			elif Input.is_action_pressed("ui_left"):
				velocity.x = -run_speed
				if Input.is_key_pressed(KEY_SPACE):
					velocity.x = -run_speed * 1.5
				sprite_2d.flip_h = true
				sprite_2d.animation = "run"
				
			elif Input.is_action_pressed("ui_right"):
				velocity.x = run_speed
				if Input.is_key_pressed(KEY_SPACE):
					velocity.x = run_speed * 1.5
				sprite_2d.flip_h = false
				sprite_2d.animation = "run"
				
			elif is_on_floor_only():
				velocity.x = 0			
				sprite_2d.animation = "idle"
			
	

	move_and_slide()
