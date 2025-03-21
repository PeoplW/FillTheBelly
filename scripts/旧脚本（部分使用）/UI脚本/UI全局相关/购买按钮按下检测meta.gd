extends Button

class_name Purchase_Button

var 购买按钮 = self


func _process(delta: float) -> void:
	if 购买按钮.has_meta("build_name"):
		if not 购买按钮.pressed.is_connected(当前名称):
			购买按钮.pressed.connect(当前名称)

#扩展UI二级菜单使用
func 当前名称():
	Quanju_UI_var.当前扩展建筑名称 = 购买按钮.get_meta("build_name")
	
	#var 建筑选择node = 购买按钮.get_parent().get_parent().get_node("建筑图片")
	#var 建筑层数
	#var 建筑类型
	#for level in 建筑选择node.get_children():
		#if level.visible == true :
			#建筑层数 = level
			#if 建筑层数 != null :
				#for style in 建筑层数.get_children():
					#if style.visible == true :
						#print("到检测层数了")
						#建筑类型 = style
				#if 建筑类型 != null :
					#for image in 建筑类型.get_children():
						#if image.get_meta("builds_name") == Quanju_UI_var.当前扩展建筑名称 :
							#print("到检测类型了")
							#image.visible == true
							#if image.is_visible():
								##if image.has_meta("builds_name"):
									##var 建筑名称 = image.get_meta("builds_name")
									##Quanju_UI_var.当前扩展建筑名称 = 建筑名称
								#if image.has_meta("price"):
									#var 建筑价格 = image.get_meta("price")
									#Quanju_UI_var.当前扩展建筑价格 = 建筑价格
								#if image.has_meta("popular"):
									#var 建筑人气 = image.get_meta("popular")
									#Quanju_UI_var.当前扩展建筑人气 = 建筑人气
