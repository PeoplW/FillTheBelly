extends CharacterBody2D

signal 被选中(顾客实例)

@onready var 顾客动画 = $"客人/客人test"
@onready var 顾客动画播放 = $AnimationPlayer

@onready var 导航: NavigationAgent2D = $"导航/NavigationAgent2D"

@onready var animation_tree: AnimationTree = $AnimationTree

@onready var 顾客图片 = $"客人"
var 顾客名称 
var 顾客编号
var 确定图片次数 = 0



@export var 速度 := 200


var 排队位置node 

@export var is_moving = false 






func _process(delta: float) -> void:
	move()
	#update_anime()
	



func move():
	if int(导航.distance_to_target() > 260 ):
		#print("现在导航的位置是",导航.target_position)
		#print(self.position)
		#print("现在",Customer_var.顾客状态["顾客名称"][str(Customer_var.顾客1名称)],"距离终点的距离是",导航.distance_to_target())
		var 顾客移动方向 = to_local(导航.get_next_path_position()).normalized()
		velocity = 顾客移动方向 * 速度
		move_and_slide()
		is_moving = true
		顾客动画播放.play("移动")
		#print(is_moving)
		#print(导航.distance_to_target())
	elif int(导航.distance_to_target() < 260 and 导航.distance_to_target() > 0 ) :
		velocity = Vector2.ZERO
		global_position = 排队位置node.global_position
		is_moving = false 
		顾客动画播放.play("待机")
		await get_tree().create_timer(1.1).timeout
	#print("顾客编号",顾客编号)
	Customer_var.当日顾客列表
	#顾客图片数集
	if 顾客图片 :
		if 确定图片次数 == 0 :
			print("来了嗷")
			for customer_image in 顾客图片.get_children():
				if customer_image.name == str(Customer_var.新顾客["顾客名称"]) :
					确定图片次数 += 1
					顾客编号 = Customer_var.当日叫号数量
					customer_image.visible = true
				else:
					确定图片次数 += 1
					customer_image.visible = false
		else :
			return
				

func _on_timer_timeout() -> void:
	#现在是每隔0.1秒确认桌椅位置
	if 排队位置node :
		导航.target_position = 排队位置node.global_position
		导航.target_position = 导航.get_final_position()
		pass # Replace with function body.


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
	# 触发拖拽
		get_viewport().set_input_as_handled()
		emit_signal("被选中", self)
