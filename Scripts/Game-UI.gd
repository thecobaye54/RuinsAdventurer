extends Control

class_name GameUI

export (Color) var healthFullColor = Color.red
export (Color) var healthEmptyColor = Color.white

onready var hintLabel = get_node("Hint")

onready var healthTex1 : TextureRect = get_node("StatsBar/Health/Health_1")
onready var healthTex2 : TextureRect = get_node("StatsBar/Health/Health_2")
onready var healthTex3 : TextureRect = get_node("StatsBar/Health/Health_3")

onready var healths : Array = [ healthTex1, healthTex2, healthTex3 ] 

onready var treasureLabel : Label = get_node("StatsBar/Treasures/Label")

onready var capArray : Array = [ get_node("Capabilities/CheckAround"), get_node("Capabilities/LightAround") ]

func show_hint(start : String, key : String, end : String):
	hintLabel.set_text(start + key + end)
	hintLabel.set_visible(true)
	
func clear_hint():
	hintLabel.set_visible(false)
	
func update_stats():
	var stats : PlayerStats = get_node("/root/PlayerStats")
	
	treasureLabel.set_text(str(stats.treasures) + "/" + str(stats.treasuresMax))
	
	for i in range(healths.size()):
		var health : TextureRect = healths[i]
		if (i < stats.health):
			health.self_modulate = healthFullColor
		else:
			health.self_modulate = healthEmptyColor

func update_caps(values : Array):
	for i in range(capArray.size()):
		capArray[i].set_progress(values[i])
