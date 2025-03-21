extends Node2D

@onready var 背景 = $BgYozoraNightSky


func _ready() -> void:
	Quanju_var.UI背景初始x = 背景.position.x
	Quanju_var.UI背景初始y = 背景.position.y
	
func 背景移动():
	背景.position.x -= 0.1
	背景.position.y -= 0.1
	
	if 背景.position.x <= Quanju_var.UI背景初始x - 450 :
		背景.position.x = Quanju_var.UI背景初始x
		背景.position.y = Quanju_var.UI背景初始y 



func _process(delta: float) -> void:
	背景移动()
