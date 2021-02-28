extends Control

class_name CapabilityUI

export (Texture) var icon : Texture
export (String) var key : String

func _ready():
	$Icon.set_texture(icon)
	$Icon/Key.set_text(key)

func set_progress(value : float):
	$Icon/TextureProgress.set_value(value)
