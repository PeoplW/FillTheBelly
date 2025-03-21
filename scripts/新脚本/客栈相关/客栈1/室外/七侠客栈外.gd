extends Node2D

#
#
#
#
func _on_客人进门随机数_timeout() -> void:
	Customer_var.进门随机数 =  randf_range(1, 100) 
	print(Customer_var.进门随机数)
	#pass

func 添加顾客到排队队列(顾客类型):
	## 实例化顾客节点（加载对应类型顾 客图片）并添加到排队节点列表中
	var 新顾客 = CustomerUtils.创建顾客节点(顾客类型)
	get_node("顾客排队父节点").add_child(新顾客)  # 假设CustomerQueueParentNode是管理排队顾客的父节点
	var 顾客变量 = get_node("/root/CustomerVars")  # 根据实际自动加载的节点路径获取CustomerVars节点
	顾客变量.室外顾客排队列表.append(新顾客)
	顾客变量.室外顾客类型顺序.append(顾客类型)
#
func 将顾客移入室内():
	var 顾客变量 = get_node("/root/CustomerVars")  # 根据实际自动加载的节点路径获取CustomerVars节点
	if 顾客变量.室外顾客排队列表.size() > 0:
		var 要移入室内的顾客 = 顾客变量.室外顾客排队列表.pop_front()
		var 要移入室内的顾客类型 = 顾客变量.室外顾客类型顺序.pop_front()
		var 室内场景 = get_tree().get_root().get_node("IndoorScene")
		室内场景.add_child(要移入室内的顾客)  # 将顾客添加到室内场景中
		顾客变量.室内顾客数量 += 1
	else:
		## 室外空缺时，随机上座顾客
		if 顾客变量.室内顾客数量 < 4:
			var 新顾客类型 = CustomerUtils.随机选择顾客类型()
			var 新顾客 = CustomerUtils.创建顾客节点(新顾客类型)
			get_node("顾客排队父节点").add_child(新顾客)
			顾客变量.室外顾客排队列表.append(新顾客)
			顾客变量.室外顾客类型顺序.append(新顾客类型)
			var 室内场景 = get_tree().get_root().get_node("IndoorScene")
			室内场景.add_child(新顾客)
			顾客变量.室内顾客数量 += 1
