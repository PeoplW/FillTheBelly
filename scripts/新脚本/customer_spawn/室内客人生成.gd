extends Node2D

var 顾客图片 
var 顾客名称
var 顾客出现随机数
var 选中的客人node : Sprite2D
var 顾客进门概率 
var customer_spawn_pos : Array[Marker2D] = []
var customer_array_pos: Array[Marker2D] = []
@onready var 客人生成位置: Node2D = $"客人区域/CustomerSpawnInsidePos"
@onready var 客人离开位置: Node2D = $"客人区域/ExitPos/ExitPos"
@onready var 客人排队位置: Node2D = $"客人区域/CustomerArrayInsidePos"

@onready var 客人生成计时器 = get_tree().get_root().get_node("主游戏场景（集成子场景）").get_node("计时器").get_node("客人生成计时器")
@onready var 室内客人检查计时器 = get_tree().get_root().get_node("主游戏场景（集成子场景）").get_node("计时器").get_node("室内客人检查")
@onready var 测试角色 = $"客人区域/CustomerSpawnInsidePos/spawnpos1/顾客室内测试"
@onready var 单人生成位置 = $"客人区域/CustomerSpawnInsidePos/spawnpos1"
@onready var 测试排队位置 = $"客人区域/CustomerArrayInsidePos/arraypos1"
var 测试生成顾客状态保存 
const 室内顾客排队背景预加载 = preload("res://scenes/AI/顾客室内.tscn")
var 生成顾客状态保存

func _ready() -> void:
	室内客人检查计时器.connect("timeout", Callable(self, "室内客人检查"))
	for array_child in 客人排队位置.get_children() :
		if array_child is Marker2D :
			customer_array_pos.append(array_child) 
	for spawn_child in 客人生成位置.get_children() :
		if spawn_child is Marker2D :
			customer_spawn_pos.append(spawn_child) 

func 室内客人检查():
	if Customer_var.室内排队人数 < 4 :
		print("生成人物了！")
		if not Customer_var.is_connected("进门信号", Callable(self, "室内客人生成")):
			Customer_var.connect("进门信号", Callable(self, "室内客人生成"))
	if Customer_var.室内排队人数 == 4 :
		print("室内人满了")
		if Customer_var.is_connected("进门信号", Callable(self, "室内客人生成")):
			Customer_var.disconnect("进门信号", Callable(self, "室内客人生成"))
		#if not 客人生成计时器.is_connected("timeout", Callable(self, "室内客人生成")):
			#客人生成计时器.connect("timeout", Callable(self, "室内客人生成"))
	#if Customer_var.室内排队人数 == 4 :
		#print("人满了")
		#if 客人生成计时器.is_connected("timeout", Callable(self, "室内客人生成")):
			#客人生成计时器.disconnect("timeout", Callable(self, "室内客人生成"))




func 室内客人生成():
	var 室内排队客人 = 室内顾客排队背景预加载.instantiate()
	customer_spawn_pos[0].add_child(室内排队客人)
	for i  in customer_array_pos :
		if i.has_meta("has_customer") and i.get_meta("has_customer") == false :
			室内排队客人.排队位置node = i
			i.set_meta("has_customer", true)
			return
	
	if int(室内排队客人.导航.distance_to_target() < 13.011 and 室内排队客人.导航.distance_to_target() > 0 ) : #13.011
		var 当前父节点 = 室内排队客人.get_parent()
		
		# 更改角色实例的父节点为数组位置1
		生成顾客状态保存 = Customer_var.顾客状态["顾客名称"][str(Customer_var.顾客1名称)]
		print("七侠客栈内大厅客人生成这个信号有用")
		
		
