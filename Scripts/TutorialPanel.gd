extends Control

func _ready():
	get_tree().paused = true

func _on_Button_pressed():
	set_visible(false)
	get_tree().paused = false
