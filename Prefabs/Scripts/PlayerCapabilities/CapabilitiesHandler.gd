extends Node2D

export (Array, PackedScene) var caps : Array
export (Array, NodePath) var cooldowns : Array

func activeCapability(nb : int):
	if nb < caps.size():
		if get_node(cooldowns[nb]).is_stopped(): # Cooldown OK
			var cap : PackedScene = caps[nb]
			if cap.can_instance():
				var instance = cap.instance()
				instance.position = position
				call_deferred("add_child", instance)
				get_node(cooldowns[nb]).start()

func _process(_delta):
	var arr : Array =  [ ]
	for i in range(cooldowns.size()):
		var cd : Timer = get_node(cooldowns[i])
		var time_left = cd.get_time_left()
		var total_time = cd.get_wait_time()
		
		var ratio = (time_left / total_time) * 100
		
		arr.append(ratio)
	
	var gameUI : GameUI = get_node("/root/Game").get_gameUI()
	gameUI.update_caps(arr)
