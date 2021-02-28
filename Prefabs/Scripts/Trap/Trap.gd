extends Sprite

class_name Trap

export (Texture) var icon : Texture

export (bool) var hasSupport = false
export (NodePath) var trapSupportPath

onready var trapIndication : Sprite = get_node("TrapIndication")
var triggered = false

var trapSupport : TrapSupport

func _ready():
	$TrapIndication.set_texture(icon)
	
	if hasSupport:
		trapSupport = get_node(trapSupportPath)
	
	trapIndication.set_visible(false)

func reveal_indication():
	trapIndication.set_visible(true)

func _on_Area2D_body_entered(body : PhysicsBody2D):
	if body == null:
		return
	
	if body.is_in_group("Player"):
		if not triggered:
			triggered = true
			reveal_indication()
			if hasSupport:
				trapSupport.trigger()
