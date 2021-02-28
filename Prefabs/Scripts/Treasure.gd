extends Sprite

export (String) var keyToOpen = "E"

var playerNear = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		playerNear = true
		var gameUI : GameUI = get_node("/root/Game").get_gameUI()
		gameUI.show_hint("Press ", keyToOpen, " to pick the treasure")

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		playerNear = false
		var gameUI : GameUI = get_node("/root/Game").get_gameUI()
		gameUI.clear_hint()

func _process(_delta):
	if Input.is_action_just_pressed("interact") && playerNear:
		var stats : PlayerStats = get_node("/root/PlayerStats")
		stats.treasures += 1
		
		var gameUI : GameUI = get_node("/root/Game").get_gameUI()
		gameUI.update_stats()
		
		if stats.treasures == stats.treasuresMax:
			get_node("/root/Game").end()
		
		queue_free()
