extends Control

export (PackedScene) var tutorialScene
export (PackedScene) var levelsMenuScene

func _on_Button_Tutorial_pressed():
	get_tree().change_scene_to(tutorialScene)

func _on_Button_Levels_pressed():
	get_tree().change_scene_to(levelsMenuScene)

func _on_Button_Quit_pressed():
	get_tree().quit()
