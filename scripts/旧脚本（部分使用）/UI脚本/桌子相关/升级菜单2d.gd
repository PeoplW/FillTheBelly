extends Control

var 桌椅升级按钮 
var 可以改位置 = false


func _ready():
	var 升级按钮 = $"菜单界面/升级_购买"

	桌椅升级按钮 = 升级按钮
	if 升级按钮 != null:
		print(升级按钮)

		升级按钮.connect("升级失败",Callable(self, "不能买提示出现") )
		#await get_tree().create_timer(0.1).timeout
		#桌椅升级按钮.disabled = false
		#print("到这了")

func 不能买提示出现():
	var 不能买提示 = preload("res://scenes/UI/不能买提示.tscn").instantiate()
	self.add_child(不能买提示)
#func _process(delta: float) -> void:
	#if  :
