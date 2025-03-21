extends Node2D

@onready var 关店牌子: Sprite2D = $"客栈其他内容/可交互位置/店面状态牌/休息牌关"
@onready var 开店牌子: Sprite2D = $"客栈其他内容/可交互位置/店面状态牌/营业牌"
@onready var 店门: Node2D = $"客栈其他内容/可交互位置/店门"

@onready var 七侠客栈外 = self.get_parent().get_parent().get_parent()



func _ready() -> void:
	print("客栈室外脚本")
	if Quanju_var.当前店状态 == "关" :
		关店牌子.visible = true
		开店牌子.visible = false
		店门.visible = true
	elif Quanju_var.当前店状态 == "开" :
		开店牌子.visible = true
		关店牌子.visible = false
		店门.visible = false






func _on_切换营业状态按钮_pressed() -> void:
	if Quanju_var.当前店状态 == "关" :
		开店牌子.visible = true
		关店牌子.visible = false
		Quanju_var.当前店状态 = "开"
		店门.visible = false
	elif Quanju_var.当前店状态 == "开" :
		开店牌子.visible = false
		关店牌子.visible = true
		Quanju_var.当前店状态 = "关"
		店门.visible = true
