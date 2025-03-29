extends Area2D

@onready var dialog_puma_init_ran = false
@onready var dialog_puma_thx_ran = false

@onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if dialog_puma_init_ran == false:
			Dialogic.start("dialog_puma_dying")
			dialog_puma_init_ran = true
		else:
			if "milk" in body.get_database():
				sprite.animation = "thank"
				if dialog_puma_thx_ran == false:
					Dialogic.start("dialog_puma_thanks")
					dialog_puma_thx_ran = true
				else:
					Dialogic.start("dialog_puma_milk")
			else:
				Dialogic.start("dialog_puma_food")
			
		
