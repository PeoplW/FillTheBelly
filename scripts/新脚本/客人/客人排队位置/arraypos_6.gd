extends Marker2D

var 排队位置6有人 = 0   #0表示没人，1表示有人




func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	排队位置6有人 = 1
	print("6号排队位置进来人了")
	set_meta("can_sit",false)

func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	排队位置6有人 = 0
	print("6号排队位置空了")
