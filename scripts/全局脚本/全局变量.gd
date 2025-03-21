extends Node

@export var 当前货币数量 = 10000

#店铺相关
var 当前位置 = "大厅"
var 现在是否开业 = true
var 当前店状态 = "开"







#动态背景相关
var UI背景初始x
var UI背景初始y




#桌椅升级相关
var UI关闭类型 = 1 #1是关闭，2是退出，可根据与后续需求增加3.4
var 桌椅升级菜单 : bool = false 
var 桌椅升级失误提示 : bool = false
var 升级失败信号 = 0
var 当前大厅节点索引: int = 2
var 当前大厅位置索引: int = 1  # 初始为大厅2
var 镜头位置 
var 当前UI界面node














func 关闭UI界面():
	if Quanju_table_var.升级菜单Node != null :
		Quanju_table_var.升级菜单Node.queue_free()
	if Quanju_table_var.当前菜单Node != null :
		Quanju_table_var.当前菜单Node.queue_free()
	#if Quanju_table_var.升级菜单Node != null:
		#Quanju_table_var.升级菜单Node.queue_free()
		#print("关闭UI界面了")
	桌椅升级菜单 = false
	升级失败信号 = 0

func 退出UI界面():
	if 当前UI界面node != null :
		当前UI界面node.queue_free()
