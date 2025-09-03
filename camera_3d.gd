extends Camera3D

@export var player_node: Sprite3D # A reference to the player node.

func _process(delta: float) -> void:
	if player_node:
		var player_position = player_node.global_position
		var camera_position = self.global_position

		# Lock to X-axis only
		self.global_position.x = player_position.x

		# Lock to Y-axis only
		# self.global_position.y = player_position.y

		# Lock to both X and Y (standard follow)
		#self.global_position = player_position

		# To lock to only 2 axes from a 3D perspective
		# Assuming a top-down view where the camera follows X and Z, but not Y
		# self.global_position.x = player_position.x
		# self.global_position.z = player_position.z
