extends Node

@export var init_state : State  #初始化状态，启动时的状态

var current_state : State    #当前的状态
var 状态字典 : Dictionary = {}

func _ready() -> void: 
	for child in get_children() :
		if child is State :
			状态字典[child.name.to_lower()] = child
			child.transistioned.connect(on_child_transitioned)
	if init_state :
		init_state.enter()
		current_state = init_state
	
	
func _process(delta: float) -> void:
	if current_state :
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state :
		current_state.physics_update(delta)


func on_child_transitioned(state: State, new_state_name: String) -> void :
	if state != current_state :
		return
	var new_state : State = 状态字典.get(new_state_name.to_lower())
	
	if current_state :
		current_state.exit()
	new_state.enter()
	current_state = new_state
