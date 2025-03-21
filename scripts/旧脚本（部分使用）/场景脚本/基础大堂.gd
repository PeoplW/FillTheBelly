extends Node2D

@export var 大厅场景: PackedScene  # 预加载大厅场景模板

@onready var 大厅节点: Node2D = $"大厅节点"
 # 引用大厅的根节点

# 定义一个信号，用于通知室外场景有顾客需要排队
#signal 顾客需排队(顾客类型)
#var customer_spawn_inside = []
#@onready var 客人生成点 = $"客人生成/客人区域/CustomerSwapnInsidePos"
##func _process(delta: float) -> void:
	##Quanju_var.镜头位置 = Vector2($"镜头".offset.x,$"镜头".offset.y)
#
#
#func _ready():
	#for spawnpos in 客人生成点 :
		#if spawnpos is Marker2D :
			#customer_spawn_inside.append(spawnpos)
	## 获取室内场景中的Timer节点并连接其timeout信号到生成顾客的函数
	#var 客人生成计时器 = get_node("客人生成计时器")
	#客人生成计时器.connect("timeout", Callable(self, "生成顾客"))
	## 连接输入事件，用于检测玩家点击
	##set_process_input(true)
##
##func _input(event):
	##if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		### 检测是否点击了室内顾客（这里假设顾客节点都是Sprite类型，可根据实际情况调整）
		##var 被点击顾客 = 获取被点击顾客(event.position)
		##if 被点击顾客!= null:
			### 移除点击的顾客节点
			##remove_child(被点击顾客)
			##var 顾客变量 = get_node("/root/CustomerVars")  # 根据实际自动加载的节点路径获取CustomerVars节点
			##顾客变量.室内顾客数量 -= 1
			##var 室外场景 = get_tree().get_root().get_node("OutdoorScene")
			##室外场景.将顾客移入室内()
#
#func 生成顾客():
	##for spawn_pos in 
	##
	#
	#if Customer_var.室内顾客数量 < 4:
		## 实例化顾客节点并设置其图片纹理（随机选择顾客类型并加载相应图片）
		#var 新顾客类型 = CustomerUtils.随机选择顾客类型()
		#var 新顾客 = CustomerUtils.创建顾客节点(新顾客类型)
		#add_child(新顾客)
		#Customer_var.室内顾客数量 += 1
	#else:
		## 室内已满，发射信号通知室外场景有顾客需要排队，并传递顾客类型信息
		#var 新顾客类型 = CustomerUtils.随机选择顾客类型()
		#emit_signal("顾客需排队", 新顾客类型)
#
#
#func 获取被点击顾客(mouse_position):
	#var 顾客节点列表 = get_children()
	#for 顾客节点 in 顾客节点列表:
		#if 顾客节点 is Sprite2D:
			#var 顾客矩形 = 顾客节点.get_rect()
			#if 顾客矩形.has_point(mouse_position):
				#return 顾客节点
	#return null
