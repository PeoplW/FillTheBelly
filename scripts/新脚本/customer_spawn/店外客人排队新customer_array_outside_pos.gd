extends CustomerArrayOutsidePos


var 顾客图片 
var 顾客名称
var 顾客出现随机数
var 选中的客人node : Sprite2D
#var 客人生成计时器 = get_parent().get_parent().get_parent().get_parent().get_node("计时器").get_node("客人生成计时器")
@onready var 客人生成计时器 = get_tree().get_root().get_node("主游戏场景（集成子场景）").get_node("计时器").get_node("客人生成计时器")



 
func _ready() -> void:
		## 连接室内场景的“顾客需排队”信号到对应的处理函数
	#var 室内场景 = get_tree().get_root().get_node("IndoorScene")
	#室内场景.connect("顾客需排队", self, "处理顾客排队")
	Customer_var.connect("门外排队信号", Callable(self, "室外排队客人生成"))
	for array_child in get_children() :
		if array_child is Marker2D :
			customer_array_pos.append(array_child) 
	for exit_child in 客人离开位置.get_children() :
		if exit_child is Marker2D :
			customer_exit_pos.append(exit_child) 


func 室外排队客人生成():
	print("七外客人排队区域，客人生成排队位置，接到信号了")
	if Customer_var.室内排队人数 == 4 : 
		顾客进门概率 = Customer_var.室外排队顾客1进门概率 
		print("七外客人排队区域，客人生成排队位置，开始循环")
		print("七外客人排队区域，顾客进门概率",顾客进门概率)
		print("七外客人排队区域，顾客进门随机数",Customer_var.进门随机数)
		print("七外客人排队区域，客人生成排队位置，进门概率过了")
		for arraypos in customer_array_pos :
			if arraypos is Marker2D :
				if arraypos.get_meta("can_sit",true) :
					print(arraypos.get_node("客人"))
					arraypos.get_node("客人").get_node("顾客图片").texture = Customer_var.室外排队顾客图片1
					arraypos.set_meta("can_sit",false)
					print("Customer_var.室外排队人数",Customer_var.室外排队人数)
					Customer_var.当日客人记录[Customer_var.室外排队顾客1名称] = Customer_var.当日叫号数量
					return
						



#func _on_排队客人生成计时器_timeout() -> void:
	#if Customer_var.室内排队人数 == 4 : 
		#顾客出现随机数 = randi() % Customer_var.顾客列表.size()
		#顾客名称 = Customer_var.顾客列表[顾客出现随机数].name
		#顾客进门概率 = Customer_var.进门概率[str(顾客名称)]
		#Customer_var.进门随机数 = randf_range(0,100)
		#顾客图片 = load("res://assets/character/客人/%s.png" % 顾客名称 )
		#if Customer_var.进门随机数 <= 顾客进门概率 :
			#for arraypos in customer_array_pos :
				#if arraypos is Marker2D :
					#if arraypos.get_meta("can_sit",true) :
						#arraypos.get_node("客人").get_node("顾客图片").texture = 顾客图片
						#arraypos.set_meta("can_sit",false)
						#Customer_var.当日客人记录[顾客名称] = 顾客进门概率
						#return


	#var 顾客生成位置索引数 : int = randf_range(0, 客人生成位置.get_children().size() - 2) 
	#顾客消失位置设置(顾客生成位置索引数)
