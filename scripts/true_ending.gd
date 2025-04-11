extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("ending")
	await Dialogic.timeline_ended
	self.animation = "end"
	$Return/Sprite2D.visible = true
	$quit.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
