extends Node2D

@onready var 顾客实例: CharacterBody2D = $".."


var 客人的进门概率

func _process(delta: float) -> void:
	for i in get_children():
		if i.visible == true :
			客人的进门概率 = i.get_meta("entry_prob")
			顾客实例.set_meta("entry_prob",客人的进门概率)
			顾客实例.进门概率 = 客人的进门概率
