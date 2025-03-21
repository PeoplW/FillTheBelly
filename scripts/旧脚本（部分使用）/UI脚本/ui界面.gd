extends Control


func _process(delta: float) -> void:
	self.get_child(1).get_child(1).text = Quanju_table_var.当前所在大堂名称



func _on_标识_pressed() -> void:
	打开菜单()

func 打开菜单():
	var 主要的菜单UI = preload("res://scenes/UI/主要的菜单UI.tscn").instantiate()
	Quanju_table_var.当前菜单Node = 主要的菜单UI #把加载的菜单场景赋给全局变量，方便删除
	var UI内容Node = get_parent()
	UI内容Node.add_child(Quanju_table_var.当前菜单Node)
	主要的菜单UI.visible = true
