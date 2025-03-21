extends TextureRect
class_name Cannot_buyit


func _ready() -> void:
	出现不能买提示()


func 出现不能买提示():
	
	var tween := get_tree().create_tween().set_parallel(true)
	tween.tween_callback(self.show)
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self,"position",Vector2(self.position.x,self.position.y+72),2)
	tween.tween_property(self,"modulate:a",1.0,2)
	await get_tree().create_timer(2).timeout
	var tweenhide := get_tree().create_tween().set_parallel(true)
	tweenhide.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tweenhide.tween_property(self,"position",Vector2(self.position.x,self.position.y),1.5)
	tweenhide.tween_property(self,"modulate:a",0.0,1.5)
	await get_tree().create_timer(0.5).timeout
	tweenhide.tween_callback(self.hide)
	self.queue_free()

	
	
