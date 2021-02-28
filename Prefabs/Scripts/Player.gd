extends KinematicBody2D

class_name Player

export (float) var speed = 200

var velocity = Vector2()

func manage_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("toggle_light"):
		$Torch.set_enabled(not $Torch.enabled)

	if Input.is_action_just_pressed("capability_1"):
		$CapabilitiesHandler.activeCapability(0)
	if Input.is_action_just_pressed("capability_2"):
		$CapabilitiesHandler.activeCapability(1)

func _process(_delta):
	manage_input()
	velocity = move_and_slide(velocity)

func loose_health():
	var stats : PlayerStats = get_node("/root/PlayerStats")
	stats.health -= 1
	$AnimationPlayer.play("hurt")
	var gameUI : GameUI = get_node("/root/Game").get_gameUI()
	gameUI.update_stats()
	if stats.health == 0:
		get_node("/root/Game").end()

func _on_Area2D_body_entered(body : PhysicsBody2D):
	if body == null:
		return

	if body.is_in_group("ArrowBullet"):
		loose_health()
		body.queue_free()
