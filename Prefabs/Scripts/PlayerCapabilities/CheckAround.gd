extends Node2D

func _on_Area2D_area_entered(area : Area2D):
	if area.get_parent().is_in_group("Trap"):
		var trap = area.get_parent()
		trap.reveal_indication()

func _on_Timer_timeout():
	queue_free()
