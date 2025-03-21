extends CharacterBody2D

@onready var 顾客图片 = $"客人/客人test"
@onready var 顾客动画播放 = $AnimationPlayer
@onready var 顾客随机节点 :Node2D  = $"客人" 



@onready var 导航: NavigationAgent2D = $"导航/NavigationAgent2D"




@export var 进门概率 = 0

@export var 速度 := 100


@export var 排队位置node : Marker2D

@export var 消失位置 : Marker2D
@export var 排队位置 : Marker2D
@export  var 目标位置 : Marker2D

var 叫号牌:int = 0 

var 进屋吗 = ""



@export var is_moving = false 
var 距离目的地位置 

func _ready() -> void:
	for child in 顾客随机节点.get_children() : 
		if child.visible == true :
			self.set_meta("entry_prob",child.get_meta("entry_prob"))
			进门概率 =  child.get_meta("entry_prob")


func _physics_process(delta: float) -> void:
	if velocity.x > 0:
		顾客图片.flip_h = true
	else:
		顾客图片.flip_h = false
	
	#实时更新顾客图层，y越大，人物越靠下，图层越高
	z_index =  global_position.y - 600
	
func _process(delta: float) -> void:
	pass
	

func _on_timer_timeout() -> void:
	if 目标位置 :
	#现在是每隔0.1秒确认桌椅位置
		导航.target_position = 目标位置.position
		导航.target_position = 导航.get_final_position()
	pass # Replace with function body.
