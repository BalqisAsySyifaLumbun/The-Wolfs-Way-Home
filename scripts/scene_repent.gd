extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.run_dialog_opening == false:
		Global.stop_move = true
		Dialogic.start('found')
		await Dialogic.timeline_ended
		Global.stop_move = false
		Global.run_dialog_opening = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
