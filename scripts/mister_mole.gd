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
		if Global.mister_mole == false:
			if "mine" not in Global.get_database():
				Global.set_database("mine")
			print("Player entered Area2D")
			Global.stop_move = true
			Dialogic.start("mine_mole_talk")
			await Dialogic.timeline_ended
			Global.stop_move = false
			Global.mister_mole = true
			
		else:
			Dialogic.start("please_abort")
