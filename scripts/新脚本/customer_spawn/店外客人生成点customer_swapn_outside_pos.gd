extends Node2D

class_name CustomerSwapnOutsidePos


signal create_customer
var customer_spwan_pos : Array[Marker2D] = []
var customer_exit_pos : Array[Marker2D] = []
var customer_array_pos: Array[Marker2D] = []
var 顾客消失位置索引数 : int 
var 顾客排队位置索引数 : int 
var 顾客进门状态
var 顾客目标位置 
@onready var 客人离开位置: Node2D = $CustomerSwapnOutEndPos
@onready var 客人排队位置: Node2D = $"../CustomerArrayOutsidePos2"

const 顾客游走背景预加载 = preload("res://scenes/AI/顾客室外(游走).tscn")








func _ready() -> void:
	for spawn_child in get_children() :
		if spawn_child is Marker2D :
			customer_spwan_pos.append(spawn_child) 
	for exit_child in 客人离开位置.get_children() :
		if exit_child is Marker2D :
			customer_exit_pos.append(exit_child) 
	for array_child in 客人排队位置.get_children() :
		if array_child is Marker2D :
			customer_array_pos.append(array_child) 

func 游走顾客生成(位置索引数 : int) -> void:
	print("顾客游走生成了")
	var 顾客 = 顾客游走背景预加载.instantiate()
	顾客进门状态 = 顾客.get_meta("entry_door")
	顾客目标位置 = 顾客.目标位置
	print("加载客人")
	if 位置索引数 == 1 or 位置索引数 == 0:
		顾客消失位置索引数 = randf_range(2, 客人离开位置.get_children().size() - 1)
		Customer_var.当前室外客人预消失目标位置 = customer_exit_pos[顾客消失位置索引数]
		顾客.目标位置 = customer_exit_pos[顾客消失位置索引数] 
		print("到了消失客人点的位置了，目的地是 ",Customer_var.当前室外客人预消失目标位置)
		customer_spwan_pos[位置索引数].add_child(顾客)
		create_customer.emit(顾客)
	elif 位置索引数 == 3 or 位置索引数 == 2:
		顾客消失位置索引数 = randf_range(0, 1)
		Customer_var.当前室外客人预消失目标位置 = customer_exit_pos[顾客消失位置索引数]
		顾客.目标位置 = customer_exit_pos[顾客消失位置索引数] 
		print("到了消失客人点的位置了，目的地是 ",Customer_var.当前室外客人预消失目标位置)
		customer_spwan_pos[位置索引数].add_child(顾客)
		create_customer.emit(顾客)



func _on_客人生成计时器_timeout() -> void:
	var 顾客生成位置索引数 : int = randf_range(0, get_children().size() - 2) 
	游走顾客生成(顾客生成位置索引数)


func _on_客人进门随机数_timeout() -> void:
	pass # Replace with function body.
