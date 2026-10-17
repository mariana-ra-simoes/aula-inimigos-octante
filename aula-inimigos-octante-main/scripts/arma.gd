extends Area2D




func _on_bod_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if(body.has_method("arma")):
		pass
