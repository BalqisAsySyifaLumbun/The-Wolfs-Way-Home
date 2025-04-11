extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport, event, shape_idx):
	# Check if it's a mouse button event (left click)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Global.incorrect_password < 3:
				#var player_text = text1.text.to_upper()
				#rint("Player answer type:", player_text)
				if $TextEdit.get_text().to_upper() != 'ACCESS':
					Global.incorrect_password += 1
					Dialogic.start("cutscene_wrong_2")
				else:
					$TextEdit.visible = false
					$TextEdit2.visible = true
					$TextEdit4.visible = true
					$TextEdit5.visible = true
					$TextEdit6.visible = true
					$TextEdit7.visible = true
					if Global.met_jackalope == false:
						$TextEdit3.visible = true
					
					if $TextEdit2.get_text().to_upper() != 'PLEASE' and $TextEdit2.get_text().to_upper() != 'FLEAS':
						Dialogic.start("wrong")
					
					if Global.met_jackalope == false:
						if $TextEdit3.get_text().to_upper() != 'A':
							Dialogic.start("wrong")
					
					if $TextEdit4.get_text().to_upper() != 'BOARD' and $TextEdit4.get_text().to_upper() != 'ABORT':
						Dialogic.start("wrong")
					
					if $TextEdit5.get_text().to_upper() != 'HOUR' and $TextEdit5.get_text().to_upper() != 'OUR':
						Dialogic.start("wrong")
					
					if $TextEdit6.get_text().to_upper() != 'MINE':
							Dialogic.start("wrong")
							
					if $TextEdit7.get_text().to_upper() != 'PERMIT':
							Dialogic.start("wrong")
					
					else:
						$TextEdit2.visible = false
						$TextEdit4.visible = false
						$TextEdit5.visible = false
						$TextEdit6.visible = false
						$TextEdit7.visible = false
						$TextEdit3.visible = false
						if Global.met_jackalope == false:
							$AnimatedSprite2D.animation = "no_dict"
							Dialogic.start("finish_good")
							await Dialogic.timeline_ended
							$AnimatedSprite2D.animation = "dict"
						if Global.met_jackalope == true:
							$AnimatedSprite2D.animation = "dict"
							Dialogic.start("finish_great")
							await Dialogic.timeline_ended
							$AnimatedSprite2D.animation = "new_animation"
						Dialogic.start("send")
						await Dialogic.timeline_ended
						get_tree().change_scene_to_file("res://scenes/true_ending.tscn")
			else:
				Global.mister_mole = false
				Global.run_dialog_opening = false
				Dialogic.start("pretryagain")
				await Dialogic.timeline_ended
				Global.incorrect_password = 0
				get_tree().change_scene_to_file("res://scenes/true_retry_scene.tscn")
