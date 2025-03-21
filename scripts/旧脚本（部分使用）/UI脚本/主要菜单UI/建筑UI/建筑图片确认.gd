extends Node2D

@onready var 建筑类型 = $"."
@onready var 建筑图片 = 建筑类型.get_children()
 

func _process(delta: float) -> void:
	if 建筑类型.visible == true :
		for child in 建筑图片 :
			if child.has_meta("builds_name")  :
				if child.get_meta("builds_name") == Quanju_UI_var.当前扩展建筑名称 :
					child.visible = true
				else :
					child.visible = false
