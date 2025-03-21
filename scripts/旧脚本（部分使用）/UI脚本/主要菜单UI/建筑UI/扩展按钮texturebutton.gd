extends TextureButton
class_name Extend_building_button
#
#
#@onready var 扩展按钮 = $"."
#var 扩展位置 
#var 扩展位置类型
#@onready var 扩展节点UI = $".".get_parent().get_parent().get_parent().get_node("扩展UI")
#@onready var 扩展位置父节点 = $".".get_parent()
#
#
#
#func _ready() -> void:
	#if 扩展按钮.has_meta("extend_pos") :
		#扩展位置 = 扩展按钮.get_meta("extend_pos")
	#if 扩展按钮.has_meta("extend_name") :
		#扩展位置类型 = 扩展按钮.get_meta("extend_name")
		#
#
#func _process(delta: float) -> void:
	#if Quanju_UI_var.菜单级数 == 0:
		#if Quanju_UI_var.建筑扩展一级菜单连接 == 0 :
			#if not 扩展按钮.pressed.is_connected(建筑扩展):
				#扩展按钮.pressed.connect(建筑扩展)
	#
			#
			#
			#
#
#func 建筑扩展():
	#Quanju_UI_var.图片放置节点按钮 = 扩展按钮
	#Quanju_UI_var.返回按钮Node.visible = false
	#Quanju_UI_var.扩展位置状态["位置"] = ""
	#Quanju_UI_var.扩展位置状态["位置"] = 扩展位置父节点.get_meta("extend_pos")
	#Quanju_UI_var.扩展位置状态["状态"] = 扩展位置父节点.get_meta("building_state")
	#print("扩展点位置  ",扩展位置父节点)
	#Quanju_UI_var.当前扩展位置节点 = 扩展位置父节点
	#Quanju_UI_var.当前扩展位置图标放置节点 = 扩展位置父节点.get_node("扩展位置图标")
	##扩展节点UI.add_child(大堂建筑菜单) 
	#if 扩展按钮.has_meta("extend_pos") :
		#Quanju_UI_var.选中的建筑["层位置"] = 扩展按钮.get_meta("extend_pos")
		#print("有扩展")
		#if "一层" in 扩展位置 :
			#Quanju_UI_var.选中的建筑["层数"] = "一层"
		#if "二层" in 扩展位置 :
			#Quanju_UI_var.选中的建筑["层数"] = "二层"
		#print("当前层数是",Quanju_UI_var.选中的建筑["层数"])
		#var 建筑扩展UI = preload("res://scenes/UI界面/建筑菜单相关/扩展UI.tscn").instantiate()
		#print("建筑扩展UI是",建筑扩展UI)
		#扩展节点UI.add_child(建筑扩展UI)
		#Quanju_UI_var.菜单级数  +=1
		#Quanju_UI_var.建筑扩展一级菜单连接 += 1
		##match 扩展位置:
#
		##match 扩展位置类型:
			##"扩展店面": Quanju_UI_var.选中的建筑["建筑类型"] = 扩展位置类型
			#
