extends Control




func _process(delta: float) -> void:
	if Quanju_UI_var.是否要退出 == true :
		self.queue_free()
		Quanju_UI_var.是否要退出 = false
		#self.visible = false
	if Quanju_UI_var.选中的建筑["层数"] == "一层" :
		$"建筑扩展选项/一层".visible = true
		$"建筑扩展选项/二层".visible = false
	if Quanju_UI_var.选中的建筑["层数"] == "二层" :
		$"建筑扩展选项/一层".visible = false
		$"建筑扩展选项/二层".visible = true
