extends CanvasLayer

@onready var 黑色转场遮罩 = $ColorRect
@onready var 防误触遮罩 = $ColorRect2
@onready var camera1: Camera2D = $Camera2D
@onready var camera2: Camera2D = $Camera2D2
var 预加载客栈内大厅 =  preload("res://scenes/qixia/客栈部分/完整/七侠客栈内大厅.tscn").instantiate()

func 进入客栈内change_scene(path: String): #专属客栈外进入客栈大厅
	var tween := get_tree().create_tween()
	#tween.tween_property(camera1,"zoom",Vector2(2,2),1)
	#tween.tween_property(get_tree().current_scene,"modulate:a",0.0,0.3)
	#tween.tween_property(camera1,"zoom",Vector2(1,1),0.1)
	#get_tree().add_child(预加载客栈内大厅)
	##tween.tween_callback(get_tree().change_scene_to_file.bind(path))
	#tween.tween_property(get_tree().current_scene,"modulate:a",0.0,0.01)
	#tween.tween_property(get_tree().current_scene,"modulate:a",1.0,1)
	#
	
	
	
	#tween.tween_callback(黑色转场遮罩.show)
	#tween.tween_callback(防误触遮罩.show)
	#tween.tween_property(黑色转场遮罩,"color:a",1.0,0.3)
	#tween.tween_callback(黑色转场遮罩.show)
	#tween.tween_callback(get_tree().change_scene_to_file.bind(path))
	#tween.tween_callback(黑色转场遮罩.show)
	#tween.tween_property(黑色转场遮罩,"color:a",1.0,0.2)
	#tween.tween_property(黑色转场遮罩,"color:a",0.0,0.5)
	#tween.tween_callback(黑色转场遮罩.hide)
	#tween.tween_callback(防误触遮罩.hide)
