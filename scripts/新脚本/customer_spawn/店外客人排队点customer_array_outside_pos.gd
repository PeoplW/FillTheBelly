extends Node2D

class_name CustomerArrayOutsidePos


signal create_customer
var customer_spwan_pos : Array[Marker2D] = []
var customer_exit_pos : Array[Marker2D] = []
var customer_array_pos: Array[Marker2D] = []
var 顾客消失位置索引数 : int 
var 顾客排队位置索引数 : int 
var 顾客进门状态
var 顾客消失位置
var 顾客排队位置
var 顾客目标位置
var 顾客进门概率 
var 叫号牌:int
@onready var 客人生成位置: Node2D = $"../CustomerSwapnOutsidePos"
@onready var 客人离开位置: Node2D = $"../CustomerSwapnOutsidePos/CustomerSwapnOutEndPos"
@onready var 进门点: Marker2D = $"../进门点/进门点"


var 当前顾客实例


const 顾客排队背景预加载 = preload("res://scenes/AI/顾客室外(排队).tscn")








func _ready() -> void:
	for array_child in get_children() :
		if array_child is Marker2D :
			customer_array_pos.append(array_child) 
	for spawn_child in 客人生成位置.get_children() :
		if spawn_child is Marker2D :
			customer_spwan_pos.append(spawn_child) 
	for exit_child in 客人离开位置.get_children() :
		if exit_child is Marker2D :
			customer_exit_pos.append(exit_child) 
	
	
func 排队顾客生成(顾客生成位置索引数 : int) -> void:
	pass
	#var 排队顾客 = 顾客排队背景预加载.instantiate()
	#排队顾客.消失位置 = 顾客消失位置
	#排队顾客.排队位置 = 顾客排队位置
	#当前顾客实例 = 排队顾客
	#顾客进门概率 = 排队顾客.get_meta("entry_prob")
	##print("顾客进门概率",顾客进门概率)
	#顾客进门状态 = 排队顾客.get_meta("entry_door")
	#if Customer_var.室内排队人数 < 4 :
		#print("加载排队客人")
		#Customer_var.当日叫号数量 += 1
		#Customer_var.当前排队人数 += 1 
		#print("排队顾客.叫号牌",排队顾客.叫号牌 ) 
		#Customer_var.叫号[排队顾客.叫号牌] = 1
		#customer_spwan_pos[顾客生成位置索引数].add_child(排队顾客)
		#print("排队顾客进门位置",顾客排队位置)
		#print("排队顾客目标位置",顾客目标位置)
	#else :
		#print("这个不进来，在外面排队")
		#Customer_var.当日叫号数量 += 1
		#排队顾客.叫号牌 = Customer_var.当日叫号数量
		#顾客排队位置设置()
		#print("Customer_var.当日叫号数量",Customer_var.当日叫号数量 )
		#print("排队顾客.叫号牌",排队顾客.叫号牌 )
		#customer_spwan_pos[顾客生成位置索引数].add_child(排队顾客)
#
#func 顾客消失位置设置(顾客生成位置索引数 : int) -> void:
	#if 顾客生成位置索引数 == 1 or 顾客生成位置索引数 == 0:
		#顾客消失位置索引数 = randf_range(2, 客人离开位置.get_children().size() - 1)
		#Customer_var.当前室外客人预消失目标位置 = customer_exit_pos[顾客消失位置索引数]
		#顾客消失位置 = customer_exit_pos[顾客消失位置索引数] 
	#elif 顾客生成位置索引数 == 3 or 顾客生成位置索引数 == 2:
		#顾客消失位置索引数 = randf_range(0, 1)
		#Customer_var.当前室外客人预消失目标位置 = customer_exit_pos[顾客消失位置索引数]
		#顾客消失位置 = customer_exit_pos[顾客消失位置索引数] 
	##排队顾客生成(顾客生成位置索引数)
#
#
#func 顾客排队位置设置() -> void:
	#if Customer_var.室内排队人数 < 4 :
		#if Customer_var.室外还能排几个人 == 6 :  #里面没满人的时候，外面也没人排队的时候
			#Customer_var.当前室外客人排队目标位置 = 进门点
			#顾客排队位置 = 进门点
		#elif Customer_var.室外还能排几个人 != 6 :   #里面满人的时候，摆放了一个客人上桌，生的排队人数空缺
			#Customer_var.当前室外客人排队目标位置 = 进门点
			#顾客排队位置 = 进门点
	#elif Customer_var.室内排队人数 == 4 :
		#var 叫号牌数字 = Customer_var.当日叫号数量
		#var 门外排队号 = 叫号牌数字 - 5
		#for 座位 in customer_array_pos :
			#if 座位.get_meta("can_sit") == true :
				#Customer_var.当前室外客人排队目标位置 = 座位
				#return

	
	
