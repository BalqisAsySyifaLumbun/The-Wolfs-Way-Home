# The-Wolfs-Way-Home
 
## UPDATE 28/5/2025

# Hint feature:

check_1_onclick.gd and input_computer.gd, along with global.gd, cutscene_1.tscn and computer_scene.tscn is changed.

check_1_onclick.gd update
#Implementasi Hint dengan RichTextLabel
	if tries > 1:
		$RichTextLabel.visible = true
		$RichTextLabel.text = "Press H for hints."
	if Input.is_key_pressed(KEY_H):
		tries = 0
		$RichTextLabel.visible = true
		$RichTextLabel.modulate = Color(1,1,1,0.5)
		$RichTextLabel.text = "Someone's getting awkward! Why don't tell them to stop shooting pumas.. or cougars? With the words you know of course."

input_computer.gd update

func _process(delta: float) -> void:
	#Implementasi Hint dengan menekan tombol H
	if Input.is_key_pressed(KEY_H):
		$RichTextLabel.visible = true
		$RichTextLabel.modulate = Color(0,0,0,0.5)
		if Global.access_pass == false:
			$RichTextLabel.text = "The Password is Access"
		else:
			$RichTextLabel.visible = false
			$RichTextLabel2.modulate = Color(0,0,0,0.5)
			$RichTextLabel2.visible = true
			if Global.met_jackalope == true:
				$RichTextLabel2.text = "Imagine 'pleading to humans to abort ones' mining permit', haha definitely not us"
			else:
				$RichTextLabel2.text = "I'm only in your imagination, but what sentence does sound like 'Pleaseee, abort our mine permit' or something like that?"
			
