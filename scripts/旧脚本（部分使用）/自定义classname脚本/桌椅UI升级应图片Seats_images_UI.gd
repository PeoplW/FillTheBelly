extends Sprite2D

class_name Seats_images_UI

var 当前桌子等级
@onready var 当前桌号 = self.get_parent().get_parent().get_name()

func _process(delta):
	当前桌子等级 = Quanju_table_var.当前桌等级
	if 当前桌子等级 == 0:
		if self.name == "1":
			self.visible = true
		else:
			self.visible = false
	elif 当前桌子等级 == 1:
		if self.name == "2":
			self.visible = true
		else:
			self.visible = false
	elif 当前桌子等级 >= 2:
		if self.name == "3":
			self.visible = true
		else:
			self.visible = false
