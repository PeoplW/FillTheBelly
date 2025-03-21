extends Button

class_name Back_Button

@onready var back_button = self
@onready var parent_node = self.get_parent().get_parent()


func _ready() -> void:
	back_button.pressed.connect(返回键)


func 返回键():
	parent_node.queue_free()
	print("点击返回了")
	Quanju_UI_var.菜单级数 -= 1
