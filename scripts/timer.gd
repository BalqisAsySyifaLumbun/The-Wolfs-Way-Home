extends Label

var time_left: float = 90.0  # Total time in seconds
var time_passed: float = 0.0  # Time passed since the last frame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Display the initial time
	update_time_display()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Increase the time passed by the delta
	if Global.is_counting == true:
		time_passed += delta

		# If at least 1 second has passed, update the countdown
		if time_passed >= 1.0:
			time_left -= 1
			time_passed = 0.0  # Reset time passed for the next second
			update_time_display()

			# Check if the countdown has finished
			if time_left <= 0:
				print("Countdown finished!")
				Global.is_counting = false
				Global.pickup += 1
				if Global.pickup > 3:
					Global.stop_move = true
					Dialogic.start('preretry2')
					await Dialogic.timeline_ended
					get_tree().change_scene_to_file("res://scenes/true_retry_scene.tscn")
				else:
					get_tree().change_scene_to_file("res://scenes/retry.tscn")

# Updates the label with the remaining time in seconds
func update_time_display() -> void:
	text = "TIME LEFT:\n"+ str(time_left) + "\n"
