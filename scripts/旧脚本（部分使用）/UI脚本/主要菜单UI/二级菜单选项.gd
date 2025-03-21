extends TextureButton
class_name Submain_ui

@onready var submain_ui_button = $"."
@onready var 父根节点UI = $".".get_parent().get_parent().get_parent().get_parent()
@onready var 当前场景位置 = $".".get_parent().get_parent().get_parent().get_parent().get_meta("current_pos")
var 当前按钮作用 



func _ready():
	submain_ui_button.pressed.connect(submain_ui_pressed)

func submain_ui_pressed():
	if submain_ui_button.has_meta("UI_kinds") :
		match submain_ui_button.get_meta("UI_kinds"):
			"吃什么":
				if 当前场景位置 == 1:
					var 菜品信息 = preload("res://scenes/UI/菜品菜单相关/菜品信息界面.tscn").instantiate()
					父根节点UI.add_child(菜品信息)
					
			
			
