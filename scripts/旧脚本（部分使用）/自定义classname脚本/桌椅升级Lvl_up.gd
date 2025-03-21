extends Area2Dtouch

class_name Lvl_up_area


@onready var current_node = $"."
var 升级界面: bool  = false
var seats 
var UI点击次数 = 0


func _interact() :
	#继承_interact()方式，在interactable可交互对象脚本中
	
	
	super._interact()
	print("点了")
	Quanju_var.桌椅升级菜单 = true
	var 父节点桌号 = current_node.get_parent().get_name()
	UI点击次数 += 1
	print("父节点桌号  ",父节点桌号.to_int())
	Quanju_table_var.当前桌号 = 父节点桌号
	Quanju_table_var.新增桌号 = (Quanju_table_var.是第几个大堂-1)*6 + 父节点桌号.to_int()
	if not Quanju_table_var.当前桌号 in Quanju_table_var.桌子等级 :
		Quanju_table_var.桌子等级[str(Quanju_table_var.新增桌号)] = 0
	else :
		pass


	seats = get_parent().get_node("seats")
	Quanju_var.UI关闭类型 = 1
	if Quanju_var.桌椅升级菜单 == true :
		出现升级界面()
	


func 出现升级界面() :
	var aim_UI_node = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("UI内容")
	var ui_scene = preload("res://scenes/UI/升级菜单2D.tscn").instantiate()
	Quanju_table_var.升级菜单Node = ui_scene #把加载的菜单场景赋给全局变量，方便删除
	#await get_tree().create_timer(2).timeout
	aim_UI_node.add_child(ui_scene)
	
	#ui_scene.name = "ui_scene"
	#if not get_node_or_null("ui_scene"):
		#var ui_scene = preload("res://scenes/UI界面/升级菜单2D.tscn").instantiate()
		#Quanju_table_var.升级菜单Node = ui_scene #把加载的菜单场景赋给全局变量，方便删除
		#aim_UI_node.add_child(ui_scene)
	var 点击区域 = current_node.get_node("area")
	#print("点击区域",点击区域)
