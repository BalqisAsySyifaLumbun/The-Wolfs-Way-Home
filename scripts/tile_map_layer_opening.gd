extends Area2D

@onready var tilemaps = $TileMapLayer2
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
		if "stop" not in Global.get_database():
			Dialogic.start("monolog_stop") # Replace with your dialog code.
		else:
			# Hide the TileMap and CollisionShape2D
			tilemaps.visible = false
			collision.visible = false

			# Free the TileMap and CollisionShape2D from the scene
			tilemaps.queue_free()
			collision.queue_free()
