extends Node2D

@onready var 金钱数目 = $"资源/钱/数目"
@onready var 建筑icon位置 = $"建筑icon"
var 图片放置节点按钮
var 新建筑图片 
var new_build_working_path = load("res://assets/extend/buildings/正在施工中.png")
var 施工图片
var 图片放置节点
var 施工生成次数 = 0
var 已经生成过 = false





#确定扩建建筑的信号 
signal 建筑更新(目标位置:String, 建筑名称:String)


func _ready() -> void:
	Quanju_UI_var.建筑菜单node =  self



func _process(delta: float) -> void:
	
	if Quanju_UI_var.菜单级数 == 0 :
		$"返回".visible = true
	金钱数目.text = str(Quanju_var.当前货币数量)



func 施工图片生成():
	Quanju_UI_var.图片放置节点按钮.disabled = true
	Quanju_UI_var.图片放置节点按钮.modulate = Color(0, 0, 0, 0.0)  # 设置modulate透明度
	if Quanju_UI_var.是否确认扩展 == true :
		for 施工位置 in 建筑icon位置.get_children():
			if 施工位置.get_meta("building_state") == "施工中" :
				施工图片 = Sprite2D.new()
				施工图片.name = "施工图片"
				施工图片.texture = new_build_working_path
				施工图片.scale = Vector2(0.5,0.436)
				if 施工图片.name == "施工图片" :
					图片放置节点 = 施工图片
				var 施工图片位置 = Quanju_UI_var.当前扩展位置图标放置节点
				施工图片位置.add_child(施工图片)
				await get_tree().create_timer(0.1).timeout
				print(图片放置节点)
				施工位置.set_meta("building_state","施工完成")
				施工生成次数 += 1
				print("施工位置是",施工位置)
		新建建筑()
	Quanju_UI_var.是否确认扩展 = false
		
\
func 新建建筑():
	#if Quanju_UI_var.是否确认扩展 == true :
	print("到新建建筑了！！！")
	var 当前建筑 = Quanju_UI_var.选中的建筑["选择的建筑"]
	print("当前建筑:", 当前建筑)
	var new_build_image_path = load("res://assets/extend/buildings/%s.png" % 当前建筑 )
	print("建筑图片是  ",new_build_image_path)
	await get_tree().create_timer(1.5).timeout
	图片放置节点.queue_free()
	for 扩展位置 in 建筑icon位置.get_children():
		if 扩展位置.get_meta("building_state") == "施工完成" :
			print("到新建建筑的循环了！！！")
			新建筑图片 = Sprite2D.new()
			新建筑图片.texture = new_build_image_path
			print("建筑图片是  ",new_build_image_path)
			新建筑图片.scale = Vector2(0.8,0.8)
			图片放置节点 = 新建筑图片
			print(图片放置节点)
			var 新建筑图片位置 = Quanju_UI_var.当前扩展位置图标放置节点
			新建筑图片位置.add_child(新建筑图片)
			扩展位置.set_meta("building_state","建造完成")
	建筑更新.emit( Quanju_UI_var.选中的建筑["层位置"],Quanju_UI_var.选中的建筑["选择的建筑"])
	#Quanju_UI_var.是否确认扩展 = false
