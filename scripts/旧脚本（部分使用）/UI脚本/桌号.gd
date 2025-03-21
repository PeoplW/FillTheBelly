extends TextEdit







func _process(delta):
	if Quanju_table_var.新增桌号  <= 9 :
		$".".text ="  " + str(Quanju_table_var.新增桌号) + "号桌"
	if Quanju_table_var.新增桌号  > 9 :
		$".".text =" " + str(Quanju_table_var.新增桌号) + "号桌"
