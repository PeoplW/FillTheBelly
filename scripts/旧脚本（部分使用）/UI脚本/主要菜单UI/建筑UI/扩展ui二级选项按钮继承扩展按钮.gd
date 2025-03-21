extends TextureButton
class_name Extend_building_button_sub

@onready var 扩展按钮 = $"."
@onready var 扩展位置 = $".".get_meta("extend_pos")
@onready var 扩展位置类型 = $".".get_meta("extend_name")
@onready var 三级节点UI = $".".get_parent().get_parent().get_parent().get_node("三级UI")



func _process(delta: float) -> void:
	if Quanju_UI_var.菜单级数 == 1:
		if Quanju_UI_var.建筑扩展二级菜单连接 == 0 :
			if not 扩展按钮.pressed.is_connected(建筑扩展二级菜单):
				扩展按钮.pressed.connect(建筑扩展二级菜单)	
				print("连接二级按钮")
			

func 建筑扩展二级菜单():
	print("点了二级按钮")
	if 扩展按钮.has_meta("extend_name") :
		Quanju_UI_var.选中的建筑["建筑类型"] = 扩展位置类型
		Quanju_UI_var.菜单级数  +=1
		Quanju_UI_var.建筑扩展二级菜单连接 += 1 
		var 建筑扩展UI二级选择菜单 = preload("res://scenes/UI界面/建筑菜单相关/扩展ui二级菜单.tscn").instantiate()
		三级节点UI.add_child(建筑扩展UI二级选择菜单)
