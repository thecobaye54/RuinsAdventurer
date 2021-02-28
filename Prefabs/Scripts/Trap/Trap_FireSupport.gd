extends TrapSupport

export (float) var rotationDegrees = 0

var playerInZone = false
var playerTouched = false
var playerTriggered = false

func _ready():
	var diff = $Particles2D.position - $Pivot.position
	
	var rotated = diff.rotated(rotationDegrees)
	
	$Particles2D.position = rotated
	$Particles2D.rotation = rotationDegrees

func trigger():
	playerTriggered = true
	$Particles2D.set_emitting(true)
	$Light2D.set_visible(true)
	
	yield(get_tree().create_timer(0.1), "timeout")
	$Area2D.set_visible(true)

	$Timer.start()

func _process(_delta):
	if playerInZone && not playerTouched && playerTriggered:
		playerTouched = true
		var player : Player = get_node("/root/Game").get_player()
		player.loose_health()

func _on_Area2D_body_entered(body : PhysicsBody2D):
	if body == null:
		return

	if body.is_in_group("Player"):
		playerInZone = true

func _on_Area2D_body_exited(body : PhysicsBody2D):
	if body == null:
		return

	if body.is_in_group("Player"):
		playerInZone = false

func _on_Timer_timeout():
	$Area2D.set_visible(false)
	$Light2D.set_visible(false)
