extends TextureButton
class_name  back_lastscene_ui

@onready var back_button = $"."

func _ready():
	if Quanju_var.UI关闭类型 == 1:
		back_button.pressed.connect(Quanju_var.退出UI界面)
		print("关闭UI界面了")
	Quanju_var.升级失败信号 = 0
