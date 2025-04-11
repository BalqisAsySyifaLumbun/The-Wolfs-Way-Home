extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player" and Global.met_jackalope == false:
		if $TextEdit.get_text().to_upper() != 'JACKALOPE':
			Dialogic.start("donteat_jackalope")
		else:
			Dialogic.start("haha_jackalope")
			Global.met_jackalope = true
			Global.set_database("please")
			Global.set_database("abort")
			Global.set_database("our")
			if "mine" not in Global.get_database():
				Global.set_database("mine")
			Global.set_database("permit")
