extends Area2D

@onready var dialog_ran = false

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if dialog_ran == true:
			Dialogic.start("hurry")
		else:
			Dialogic.start("dialog_puma_alert")
			dialog_ran = true
