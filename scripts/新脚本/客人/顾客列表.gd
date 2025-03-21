extends Node2D


func _ready() -> void:
	self.visible = false
	for customer_child in get_children() :
		Customer_var.顾客列表.append(customer_child)
