extends State

class_name CustomerWalk

var exit_pos: Marker2D
var spawn_pos: Marker2D
@onready var 顾客实例: CharacterBody2D = $"../.."
@onready var 顾客动画播放: AnimationPlayer = $"../../AnimationPlayer"
@onready var 导航: NavigationAgent2D = $"../../导航/NavigationAgent2D"

@export var 速度 = 300
#@export var 速度 := 300

var 进门随机数




func 种族确认():
	pass


func 判断是否进屋():
	进门随机数 = randf_range(1, 100) 
	print("随机数是 ",进门随机数)
	目标位置_速度确认()
	#if 顾客实例.get_meta("entry_prob") >= 进门随机数 :
		#顾客实例.set_meta("entry_door",true)
		#顾客实例.进屋吗 = "进屋"
		 ## I进门跳转排队状态树
		
	#else :
		#顾客实例.set_meta("entry_door",false)
		#顾客实例.进屋吗 = "就溜达"
		#目标位置_速度确认()
	
		


func 目标位置_速度确认():
	#if 顾客实例.进屋吗 == "就溜达" :
	顾客实例.消失位置 = Customer_var.当前室外客人预消失目标位置
	顾客实例.目标位置 = Customer_var.当前室外客人预消失目标位置
	if 顾客实例.消失位置 :
		#print("在顾客室外gd中，顾客实例的目标位置是 ",顾客实例.目标位置)
		导航.target_position = 顾客实例.消失位置.position
		导航.target_position = 导航.get_final_position()
		print("目的地置是 ",顾客实例.目标位置)
		顾客实例.速度 = randf_range(200, 500)
		速度 = 顾客实例.速度
	
func enter() -> void :
	Customer_var.当前出现客人数量 += 1 
	顾客实例.set_meta("npc_num",Customer_var.当前出现客人数量)
	种族确认()
	#判断是否进屋()
	

func physics_update(_delta: float) -> void:
	move()
	顾客实例.距离目的地位置 = 导航.distance_to_target()

func move():
	if int(导航.distance_to_target() > 13.5 ):
		var 顾客移动方向 = 顾客实例.to_local(导航.get_next_path_position()).normalized()
		顾客实例.velocity = 顾客移动方向 * 速度
		顾客动画播放.play("移动")
		顾客实例.move_and_slide()
	elif int(导航.distance_to_target() < 13.5 ):
		ease_customer()

func ease_customer():  #消除当前npc
	顾客实例.queue_free()

func update(_delta: float) -> void :
	pass
	#if 顾客实例.进屋吗 == "进屋" :
		#transistioned.emit(self,"CustomerArray")
	

	

func exit() -> void :
	pass
