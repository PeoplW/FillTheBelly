extends Node

# 用于存储所有可用的顾客类型，初始化为ABCD四种，后续可在外部修改添加新类型
var 顾客类型列表 = ["娜美", "山治", "弗兰奇", "明哥","月光莫利亚"]
var 顾客名称
var 顾客出现随机数
var 顾客进门概率
var 顾客图片
# 静态函数，用于随机选择顾客类型
func 随机选择顾客类型():
	顾客出现随机数 = randi() % Customer_var.顾客列表.size()
	顾客名称 = Customer_var.顾客列表[顾客出现随机数].name
	顾客进门概率 = Customer_var.进门概率[str(顾客名称)]
	return 顾客类型列表[顾客出现随机数]

# 静态函数，用于创建顾客节点并加载对应类型图片纹理
#static func 创建顾客节点(顾客类型):
	#var 顾客图片路径 = "res://assets/character/客人/顾客" + 顾客类型 + ".png"
	#var 顾客图片纹理 = load(顾客图片路径)
	#if 顾客图片纹理!= null:
		#顾客节点.texture = 顾客图片纹理
	#else:
		#print("顾客图片加载失败！")
	#return 顾客节点
#
	#
	#Customer_var.进门随机数 = randf_range(0,100)
	#



## 假设在某个初始化或者配置的脚本中 写下面的增加顾客
#func _setup_customer_types():
	#customer_utils.顾客类型列表.append("E")
	#customer_utils.顾客类型列表.append("F")
	#customer_utils.顾客类型列表.append("G")
