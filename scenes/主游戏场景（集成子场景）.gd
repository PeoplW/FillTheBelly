extends Node2D

@onready var animation_player: AnimationPlayer = $"场景过度动画"
@onready var 黑色遮罩: ColorRect = $"黑色遮罩"
var 当前位置


#func _enter_tree() -> void:
	#当前位置 = Quanju_var.当前位置 
	#print("主场景脚本")

#
func _ready() -> void:
	print("主场景脚本")
	黑色遮罩.visible = false
	当前位置 = Quanju_var.当前位置 
	for scene in get_children() :
		if scene.has_meta("pos") :
			if scene.get_meta("pos") == 当前位置 :
				scene.visible = true 
				scene.scale = Vector2.ONE
				scene.modulate.a = 1
			else:
				scene.visible = false
 
