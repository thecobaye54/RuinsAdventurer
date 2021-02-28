extends Node

export (NodePath) var gameUIPath
export (NodePath) var canvasModulatePath
export (NodePath) var treasuresPath
export (NodePath) var playerPath

export (NodePath) var gameOverMenuPath
export (NodePath) var endMenuPath

onready var gameUI : GameUI = get_node(gameUIPath)
onready var canvasModulate : CanvasModulate = get_node(canvasModulatePath)
onready var treasures : Node = get_node(treasuresPath)
onready var player : Player = get_node(playerPath)

onready var gameOverMenu = get_node(gameOverMenuPath)
onready var endMenu = get_node(endMenuPath)

func _ready():
	canvasModulate.set_visible(true)
	
	var stats : PlayerStats = get_node("/root/PlayerStats")
	stats.treasuresMax = treasures.get_child_count()
	stats.treasures = 0
	stats.health = 3
	
	gameUI.update_stats()

func get_gameUI():
	return gameUI

func get_player():
	return player

func end():
	var stats : PlayerStats = get_node("/root/PlayerStats")
	if stats.health == 0:
		gameOverMenu.set_visible(true)
		get_tree().paused = true
	else:
		endMenu.set_visible(true)
		get_tree().paused = true

