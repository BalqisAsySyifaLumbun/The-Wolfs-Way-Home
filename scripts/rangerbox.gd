extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		if Global.snack_given == true and Global.milk_given == true:
			Dialogic.start("entry")
			await Dialogic.timeline_ended
			get_tree().change_scene_to_file("res://scenes/cutscene_1.tscn")
		else:
			Dialogic.start("entry_fail")
