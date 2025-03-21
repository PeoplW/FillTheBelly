extends Button

class_name lvl_up_button

@onready var lvlup_button =  $"."



signal 升级失败




func _ready():

	lvlup_button.pressed.connect(桌椅升级)
	

func 桌椅升级():
	if Quanju_var.当前货币数量 >= Quanju_table_var.升级价格:
		Quanju_var.当前货币数量 -= Quanju_table_var.升级价格
		lvlup_button.disabled = true
		Quanju_table_var.桌子等级[str(Quanju_table_var.新增桌号)] += 1 #升级桌子的等级
		lvlup_button.disabled = false

	else :
		lvlup_button.disabled = true
		升级失败.emit()
		await get_tree().create_timer(2.5).timeout
		lvlup_button.disabled = false
	#if Quanju_table_var.当前桌等级 == 2 :
		#lvlup_button.visible = false
		
		
