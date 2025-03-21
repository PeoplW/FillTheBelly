extends State

class_name CustomerArray

var array_pos: Marker2D
var exit_pos: Marker2D
var spawn_pos: Marker2D
@onready var 顾客实例: CharacterBody2D = $"../.."
@onready var 顾客动画播放: AnimationPlayer = $"../../AnimationPlayer"
@onready var 导航: NavigationAgent2D = $"../../导航/NavigationAgent2D"

@export var 速度 = 300

var 进门随机数




func 种族确认():
	pass



func 目标位置and速度确认():
	if Quanju_var.当前店状态 == "开" :
		if 顾客实例.排队位置 :
			#Customer_var.室外还能排几个人 -= 1
			顾客实例.目标位置 = 顾客实例.排队位置
			目的地导航()
		if 顾客实例.排队位置 == null :
			顾客实例.目标位置 = 顾客实例.消失位置
			目的地导航()

	if Quanju_var.当前店状态 == "关" :
		if 顾客实例.消失位置 :
			顾客实例.目标位置 = 顾客实例.消失位置
			#print("当前店关，目的地位置",顾客实例.消失位置)
			目的地导航() 
			

 
func 目的地导航():
	#直接导航
	if 顾客实例.目标位置 :
		#print("在顾客室外排队状态中，顾客实例的目标位置是 ",顾客实例.目标位置)
		导航.target_position = 顾客实例.目标位置.position
		#print("目的地位置",顾客实例.目标位置.position)
		导航.target_position = 导航.get_final_position()
		顾客实例.速度 = randf_range(200, 500)
		速度 = 顾客实例.速度
	
func enter() -> void :
	#print("这个顾客换行为了")
	顾客实例.排队位置 = Customer_var.当前室外客人排队目标位置
	顾客实例.消失位置 = Customer_var.当前室外客人预消失目标位置
	Customer_var.当前出现客人数量 += 1 
	顾客实例.set_meta("npc_num",Customer_var.当前出现客人数量)
	种族确认()
	

func physics_update(_delta: float) -> void:
	move()
	目标位置and速度确认()
	顾客实例.距离目的地位置 = 导航.distance_to_target()

func move():
	if Customer_var.室内排队人数 < 4 :
		if int(导航.distance_to_target() > 13.5 ):
			var 顾客移动方向 = 顾客实例.to_local(导航.get_next_path_position()).normalized()
			顾客实例.velocity = 顾客移动方向 * 速度
			顾客动画播放.play("移动")
			顾客实例.move_and_slide()
		elif int(导航.distance_to_target() < 13.5 ):
			ease_customer()
			print("叫号牌",顾客实例.叫号牌)
	if Customer_var.室内排队人数 >= 4 :
		#print("里面人满了，现在没有人了")
		#print("叫号牌",顾客实例.叫号牌)
		if int(导航.distance_to_target() > 13.5 ):
			var 顾客移动方向 = 顾客实例.to_local(导航.get_next_path_position()).normalized()
			顾客实例.velocity = 顾客移动方向 * 速度
			顾客动画播放.play("移动")
			顾客实例.move_and_slide()
		elif int(导航.distance_to_target() < 13.5 ):
			#ease_customer()
			pass
			#print("叫号牌",顾客实例.叫号牌)



func ease_customer():  #消除当前npc
	顾客实例.queue_free()

func update(_delta: float) -> void :
	pass
	

	

func exit() -> void :
	pass
