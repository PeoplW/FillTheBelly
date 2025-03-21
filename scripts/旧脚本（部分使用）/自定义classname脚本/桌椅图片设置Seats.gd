extends Sprite2D
class_name Seats_images

var 当前桌子等级
@onready var 当前桌号 = self.get_parent().get_parent().get_name()
func _process(delta: float) -> void:
	Quanju_table_var.当前桌子等级(str(Quanju_table_var.新增桌号))
	#当前桌号.set_meta("seats_num",str(Quanju_table_var.新增桌号))
	当前桌子等级 = Quanju_table_var.当前桌等级
	桌子图片设置()	

func 桌子图片设置():
	if 当前桌号 == Quanju_table_var.当前桌号 :
		if 当前桌子等级 >= 3:
			当前桌子等级 = 3
		if self.name == str(当前桌子等级):
			self.visible = true 
		else :
			self.visible = false
