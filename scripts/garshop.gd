extends Area2D

@onready var garsign = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if "gar" not in body.get_database():
			Dialogic.start("monolog_gar")
			body.set_database("gar")
			body.set_database("shop")
