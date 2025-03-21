extends TextureButton
class_name lvl_up_Tbutton

@onready var lvlup_button =  $"."


func _ready():
	lvlup_button.pressed.connect(桌椅升级)

func 桌椅升级():
	if Quanju_var.当前货币数量 >= Quanju_table_var.升级价格:
		if Quanju_table_var.当前桌号 == "1":
			Quanju_table_var.第1号桌等级 += 1
		if Quanju_table_var.当前桌号 == "2":
			Quanju_table_var.第2号桌等级 += 1
		if Quanju_table_var.当前桌号 == "3":
			Quanju_table_var.第3号桌等级 += 1
		if Quanju_table_var.当前桌号 == "4":
			Quanju_table_var.第4号桌等级 += 1
		if Quanju_table_var.当前桌号 == "5":
			Quanju_table_var.第5号桌等级 += 1
		if Quanju_table_var.当前桌号 == "6":
			Quanju_table_var.第6号桌等级 += 1
		if Quanju_table_var.当前桌号 == "7":
			Quanju_table_var.第7号桌等级 += 1
		if Quanju_table_var.当前桌号 == "8":
			Quanju_table_var.第8号桌等级 += 1
		if Quanju_table_var.当前桌号 == "9":
			Quanju_table_var.第9号桌等级 += 1
		
		Quanju_table_var.升级菜单Node.queue_free()  #删除/关闭UI菜单， 其他删除节点求也适用
