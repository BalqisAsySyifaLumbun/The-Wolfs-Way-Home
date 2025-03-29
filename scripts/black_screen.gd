extends Sprite2D

# Duration for the fade-out effect
var fade_duration = 3.0
var fade_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure the sprite starts with full opacity (alpha = 1)
	self.modulate.a = 1.0  # Fully opaque at the start
	fade_time = 0.0  # Reset the fade time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Fade out the sprite's alpha value
	if fade_time < fade_duration:
		fade_time += delta
		# Calculate new alpha value
		self.modulate.a = 1.0 - (fade_time / fade_duration)
		# Once the fade is complete, set it to fully transparent
		if fade_time >= fade_duration:
			self.visible = false  # Optionally hide the sprite after it fades out
