extends Control

func _on_Button_Retry_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_Button_Main_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	get_tree().paused = false

func _on_Button_Quit_pressed():
	get_tree().quit()
