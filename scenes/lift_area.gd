extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		body.set_position($Marker2D.global_position) #Credit: https://www.youtube.com/watch?v=YT5ZE0a4YtU
