extends Area2D

var on_press = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Implementasi Hint dengan menekan tombol H
	if Input.is_key_pressed(KEY_H):
		if on_press == false:
			on_press = true
			$RichTextLabel.visible = true
			$RichTextLabel.modulate = Color(0,0,0,0.5)
			if Global.access_pass == false:
				$RichTextLabel.text = "The Password is Access"
			else:
				if Global.met_jackalope == true:
					$RichTextLabel.text = "Imagine 'pleading to humans to abort ones' mining permit', haha definitely not us"
				else:
					$RichTextLabel.text = "I'm only in your imagination, but what sentence does sound like 'Pleaseee, abort our mine permit' or something like that?"
		else:
			on_press = false
			$RichTextLabel.visible = false
			
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
					if Global.incorrect_password >=1:
						$RichTextLabel.visible = true
						$Hint_Area.visible = true
				else:
					Global.access_pass = true
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
							$RichTextLabel.visible = false
							Dialogic.start("finish_good")
							await Dialogic.timeline_ended
							$AnimatedSprite2D.animation = "dict"
						if Global.met_jackalope == true:
							$AnimatedSprite2D.animation = "dict"
							$RichTextLabel.visible = false
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
