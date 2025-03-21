extends Node2D

@onready var 建筑图片 = $"."
@onready var 一层 = $".".get_node("一层")
@onready var 二层 = $".".get_node("二层")

func _process(delta: float) -> void:
	for level in 建筑图片.get_children():
		if level.name == Quanju_UI_var.选中的建筑["层数"] :
			level.visible = true
		else:
			level.visible = false
	for style in 一层.get_children():
		if style.name == Quanju_UI_var.选中的建筑["建筑类型"] :
			style.visible = true
	for style in 二层.get_children():
		if style.name == Quanju_UI_var.选中的建筑["建筑类型"] :
			style.visible = true
