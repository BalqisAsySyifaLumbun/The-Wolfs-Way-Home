extends Area2D

@onready var snack = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snack.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if "shot" not in Global.get_database():  # Check if player has the get_database method
			Dialogic.start("dialog_pickup")
			Global.set_database("shot")
			snack.visible = false
		else:
			snack.visible = false
			
