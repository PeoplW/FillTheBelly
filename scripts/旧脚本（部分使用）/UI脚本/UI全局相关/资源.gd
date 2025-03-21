extends Control

@onready var 金钱数目 = $"钱/数目"


func _process(delta: float) -> void:
	金钱数目 = Quanju_var.当前货币数量
