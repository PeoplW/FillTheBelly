extends Node2D 

@onready var 场景相机 = self.get_parent().get_parent().get_parent().get_parent().get_node("Camera2D")
@onready var 客栈内场景 = self.get_parent().get_parent().get_parent()
@onready var 客栈外场景 = self.get_parent().get_parent().get_parent().get_parent().get_node("七侠客栈外")
@onready var 场景过度动画 = self.get_parent().get_parent().get_parent().get_parent().get_node("场景过度动画")






var 当前大堂 


func _ready() -> void:
	self.set_meta("DatingNum",Quanju_table_var.当前大堂数量)
	Quanju_table_var.大堂数量[str(Quanju_table_var.当前大堂数量)] = 0
	


func _on_button_pressed() -> void:
	print("点了")
	print("当前的客栈内场景是  ",客栈内场景)
	print("当前的客栈外场景是  ",客栈外场景)
	场景过度动画.play("大厅到门口")
	Quanju_var.当前位置 = "门口"
