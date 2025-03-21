extends Area2Dtouch

class_name EnterDoor

@export_file("*.tscn") var target_scene_path : String 
@onready var 切换场景遮罩 = $"../../../../../../换场景遮罩"
@onready var 场景相机 = self.get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Camera2D")
@onready var 客栈外场景 = self.get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()
@onready var 客栈内场景 = self.get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("七侠客栈内")
@onready var 场景过度动画 = self.get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("场景过度动画")

func _interact():
	super._interact()
	场景过度动画.play("门口到大厅")
	Quanju_var.当前位置 = "大厅"
	
