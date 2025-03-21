extends Control


@onready var name_label = $"主体部分/图片位置部分/名称/数值"
@onready var price_label = $"主体部分/价格部分/价格/数值"
@onready var popular_label = $"主体部分/详情部分/人气/数值"
@onready var 扩展UI二级菜单 = self
@onready var 选项节点 = $"主体部分/图片位置部分/选项部分"
@onready var 第一个选项 = $"主体部分/图片位置部分/选项部分/第一个建筑"
var 建筑名称  = Quanju_UI_var.建筑扩展字典[str(Quanju_UI_var.选中的建筑["层数"])][str(Quanju_UI_var.选中的建筑["建筑类型"])]
var 上级UI菜单 



func _ready() -> void:
	var 选项父节点 = $"主体部分/图片位置部分/选项部分"
	Quanju_UI_var.当前扩展建筑名称 = 建筑名称["1"]
	创建TextureButton节点()
	if self.get_parent != null :
		上级UI菜单 = self.get_parent().get_parent().get_parent().get_parent()


func _process(delta: float) -> void:
	if Quanju_UI_var.当前扩展建筑名称 != null :
		name_label.text = str(Quanju_UI_var.当前扩展建筑名称)
	if Quanju_UI_var.当前扩展建筑价格 != null:
		price_label.text = str(Quanju_UI_var.当前扩展建筑价格)
	if Quanju_UI_var.当前扩展建筑人气 != null :
		popular_label.text = str(Quanju_UI_var.当前扩展建筑人气)
	



	
#
func 创建TextureButton节点():
	for i in 建筑名称 :
		if i == "1" :
			第一个选项.text = 建筑名称["1"] 
			第一个选项.set_meta("build_name",建筑名称["1"])
		if i != "1"  :
			if 建筑名称[str(i)] != "":
				print("来了嗷")
				var i_num = int(i)
				var new_button = Purchase_Button.new() # 创建新按钮
				new_button.text = 建筑名称[str(i)]
				new_button.size = Vector2(162,41)
				new_button.set_meta("build_name",建筑名称[str(i)])
				选项节点.add_child(new_button)
				new_button.position = 第一个选项.position + Vector2.DOWN * 50 * (i_num - 1)
				print("新按钮置 ",new_button.position)
			if 建筑名称[str(i)] == "" :
				return











func _on_购买按钮_pressed() -> void:
	if Quanju_var.当前货币数量 >= Quanju_UI_var.当前扩展建筑价格 :
		Quanju_var.当前货币数量 -= Quanju_UI_var.当前扩展建筑价格
		#购买后UI消失
		Quanju_UI_var.是否要退出 = true
		Quanju_UI_var.菜单级数  = 0
		Quanju_UI_var.建筑扩展一级菜单连接 = 0
		Quanju_UI_var.建筑扩展二级菜单连接 = 0
		Quanju_UI_var.选中的建筑["选择的建筑"] = Quanju_UI_var.当前扩展建筑名称
		Quanju_UI_var.当前扩展位置节点.set_meta("building_state","施工中")
		Quanju_UI_var.是否确认扩展 = true
		Quanju_UI_var.扩展位置状态["状态"] = "施工中"
		Quanju_UI_var.当前建筑状态 = "施工"
		上级UI菜单.施工图片生成()
		#指定位置出现指定建筑
		
		
		
	else :
		print("不能买")
		var 不能买提示 = preload("res://scenes/UI界面/全局UI/不能买提示.tscn").instantiate()
		self.get_node("不能买提示").add_child(不能买提示)
		
