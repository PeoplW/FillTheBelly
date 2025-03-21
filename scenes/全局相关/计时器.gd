extends Node2D

@onready var 客人生成计时器 = $"客人生成计时器"

signal 客人生成

func _on_客人生成计时器_timeout() -> void:
	emit_signal("客人生成")
