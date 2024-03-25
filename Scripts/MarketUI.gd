extends Control

@export var open_button : TextureButton
@export var animation_player : AnimationPlayer

var is_open := false

# Called when the node enters the scene tree for the first time.
func _ready():
	open_button.pressed.connect(self._toggle_ui)

func _toggle_ui():
	if !is_open:
		animation_player.play("OpenMarket")
	else:
		animation_player.play("CloseMarket")
	
	is_open = !is_open
