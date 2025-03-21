extends TextureButton

class_name UI_close

@onready var close_button = $"."
@onready var 关闭类型 = $".".get_meta("quit_style")

func _ready():
	Quanju_UI_var.返回按钮Node = self
	Quanju_var.UI关闭类型 = 关闭类型
	if Quanju_var.UI关闭类型 == 1:
		close_button.pressed.connect(Quanju_var.关闭UI界面)
		Quanju_UI_var.建筑扩展一级菜单连接 = 0
		print("关闭UI界面了")
	Quanju_var.升级失败信号 = 0
	if Quanju_var.UI关闭类型 == 2:
		Quanju_var.当前UI界面node = $".".get_parent()
		Quanju_UI_var.建筑扩展一级菜单连接 = 0
		close_button.pressed.connect(Quanju_var.退出UI界面)
		print("退出UI界面了")
