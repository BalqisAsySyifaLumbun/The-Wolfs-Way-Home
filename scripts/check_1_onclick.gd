extends Area2D

@onready var text1 = %TextEdit1
@onready var text2 = %TextEdit2
@onready var text3 = %TextEdit3
@onready var text4 = %TextEdit4

var tries = 0

var on_press = false
var player_answer = [text1,text2,text3,text4]
var collect = [0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Implementasi Hint dengan RichTextLabel
	if tries > 1:
		$RichTextLabel.visible = true
		$RichTextLabel.text = "Press H for hints."
	if Input.is_key_pressed(KEY_H):
		tries = 0
		$RichTextLabel.visible = true
		$RichTextLabel.modulate = Color(1,1,1,0.5)
		$RichTextLabel.text = "Someone's getting awkward! Why don't tell them to stop shooting pumas.. or cougars? With the words you know of course."

func _input_event(viewport, event, shape_idx):
	# Check if it's a mouse button event (left click)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if collect[0] + collect[1] + collect[2] + collect[3] < 4:
				print("Tries: ",tries)
				#var player_text = text1.text.to_upper()
				#rint("Player answer type:", player_text)
				if text1.get_text().to_upper() != 'STOP':
					collect[0] = 0
					Dialogic.start("cutscene_wrong")
					tries += 1
				else:
					collect[0] = 1
					
				if text2.get_text().to_upper() != 'SHOT':
					collect[1] = 0
					Dialogic.start("cutscene_wrong")
					tries += 1
				else:
					collect[1] = 1
				if text3.get_text().to_upper() != 'COW':
					collect[2] = 0
					Dialogic.start("cutscene_wrong")
					tries += 1
				else:
					collect[2] = 1
				if text4.get_text().to_upper() != 'GAR':
					collect[3] = 0
					Dialogic.start("cutscene_wrong")
					tries += 1
				else:
					collect[3] = 1
				
			else:
				Global.chapter_1_finish = true
				text1.visible = false
				text2.visible = false
				text3.visible = false
				text4.visible = false
				$Sprite2D.visible = false
				$RichTextLabel.visible = false
				$Type1.animation = "success"
				Dialogic.start("puma_conservation")
				await Dialogic.timeline_ended
				get_tree().change_scene_to_file("res://scenes/chapter_1_end.tscn")
				
			
