extends KinematicBody2D

class_name ArrowBullet

export (float) var speed = 300

var direction : Vector2
var velocity : Vector2

var throwed = false

func throw(dir : Vector2):
	direction = dir
	throwed = true

func _physics_process(_delta):
	if throwed:
		velocity = Vector2()
		velocity += direction.normalized()
		velocity = move_and_slide(velocity.normalized() * speed)
		
		for i in get_slide_count():
			var collider = get_slide_collision(i).get_collider()
			if collider.is_in_group("Wall"):
				queue_free()



func _on_Timer_timeout():
	$CollisionShape2D.set_deferred("disabled", false)
