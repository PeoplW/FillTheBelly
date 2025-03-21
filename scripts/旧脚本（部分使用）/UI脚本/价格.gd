extends Label

var 当前查看的桌子等级 = 0

func _process(delta):
	Quanju_table_var.等级对应升级价格(Quanju_table_var.桌子等级[str(Quanju_table_var.新增桌号)])
	当前查看的桌子等级 = Quanju_table_var.桌子等级[str(Quanju_table_var.新增桌号)]
	

	$".".text = str(Quanju_table_var.升级价格)
