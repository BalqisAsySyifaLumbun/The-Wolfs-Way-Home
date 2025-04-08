extends Area2D

@onready var tilemaps = $TileMapLayer
@onready var collision = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called when a body enters the Area2D.
func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("Player entered Area2D")
		if "milk" in Global.get_database():
			tilemaps.visible = false
			collision.visible = false
			tilemaps.queue_free()
			collision.queue_free()
