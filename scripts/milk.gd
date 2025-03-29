extends Area2D

@onready var milk = $CollisionShape2D
@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if "cow" not in body.get_database():
			Dialogic.start("dialog_pickup")
			
			body.set_database("cow")
			body.set_database("milk")
			sprite.visible = false
		else:
			sprite.visible = false
