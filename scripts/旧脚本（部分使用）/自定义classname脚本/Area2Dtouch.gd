extends Area2D


class_name Area2Dtouch

var isTouch = false
# 定义一个交互信号
signal interact

# 当输入事件被触发时，如果按下交互键，则调用_interact()函数
func _input_event(viewport, event, shape_idx):
	if not event.is_action_pressed("interact"):
		return
	_interact()
	
# 定义_interact()函数，当按下交互键时，发射交互信号
func _interact():
	emit_signal("interact")
	
