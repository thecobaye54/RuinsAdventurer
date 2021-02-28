extends TrapSupport

export (PackedScene) var arrowBullet
export (Vector2) var direction = Vector2()

func trigger():
	var instance : ArrowBullet = arrowBullet.instance()
	
	instance.rotate(direction.angle())
	
	call_deferred("add_child", instance)
	instance.call_deferred("throw", direction)
