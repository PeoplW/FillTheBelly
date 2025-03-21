extends Node2D



#当前大厅名称
func _process(delta: float) -> void:
	if Quanju_var.镜头位置 == Vector2(self.position.x ,self.position.y ):
		Quanju_table_var.当前所在大堂名称 = "尚未开发"




func _on_button春天_pressed() -> void:
	pass
	
