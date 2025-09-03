extends Node3D
@onready var collision_shape: CollisionShape3D = $Node3D/CollisionShape3D
@onready var mesh_instance: MeshInstance3D = $Node3D/MeshInstance3D


#@export var x_size: float = 5.0 : set = _set_size
#@export var y_size: float = 5.0 : set = _set_size
#@export var z_size: float = 5.0 : set = _set_size
@export var x_size: float = 5.0 
@export var y_size: float = 5.0 
@export var z_size: float = 5.0 

#func _ready():
	#_update_size()
#
#func _set_size(value):
	## this setter runs whenever one of the exported vars changes
	#_update_size()



func _process(delta):
	# Mesh scaling (assuming you’re using a primitive mesh, like a BoxMesh)
	print(mesh_instance)
	var box = BoxMesh.new()
	box.size = Vector3(x_size, y_size, 0.5)
	mesh_instance.mesh = box
	

	# Collision scaling (assuming you’re using a BoxShape3D)
	if collision_shape.shape is BoxShape3D:
		collision_shape.shape.extents = Vector3(x_size, y_size, z_size) * 0.5
		
