extends Control

export (Array, PackedScene) var levels

func _on_Button_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_Button_pressed():
	get_tree().change_scene_to(levels[0])


func _on_Button2_pressed():
	get_tree().change_scene_to(levels[1])
