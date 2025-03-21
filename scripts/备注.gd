extends Node

#备忘录


##随机数
#顾客出现随机数 = randi() % 100   整数，范围是0——（100-1）



##连接信号写法
#升级按钮##发出信号的脚本.connect("升级失败"##信号内容,Callable(self##当前脚本, "不能买提示出现"##当前脚本的函数) )

##按钮连接函数，括号内为函数
#submain_ui_button.pressed.connect(submain_ui_pressed)

##等待一个按钮被按下(信号)
#var button = Button.new()
#await button.pressed
#print("按钮被按下了")

## 使用await等待场景树中的定时器完成
#await get_tree().create_timer(1.0).timeout
#print("定时器时间到")

## 根据变量找到资源，下面的当前建筑为变量
#var new_build_image_path = load("res://assets/extend/buildings/%s.png" % 当前建筑 )

##字典添加内容


 
##信号
 #信号发送
	#假设这个代码写在 打电话node 上
	#signal 发送短信完成(目标号码:String, 短信内容:String)
	#func 发短信(电话号码:String, 短信内容:String):
		#if 已经开机:
			#print("给 " + 电话号码 + " 发信息，内容如下：" + 短信内容)
			#发送短信完成.emit(电话号码, 短信内容)
 #信号接受
	#var 打电话node = 打电话node 
	#打电话node.connect("发送短信完成",Callable(self, "发短信") )
	#func 发短信() :   #信号就连接到这个函数了
	
