extends Control

@export var open_button : TextureButton
@export var animation_player : AnimationPlayer
@export var market_resource_container : GridContainer

var _market_resource : PackedScene
var _is_open := false

# Called when the node enters the scene tree for the first time.
func _ready():
	_market_resource = preload("res://Scenes/MarketResourceUI.tscn")

	open_button.pressed.connect(self._toggle_ui)

	for resource in ResourceManager.Resources:
		var mar_res = _market_resource.instantiate()
		market_resource_container.add_child(mar_res)

func _toggle_ui():
	if !_is_open:
		animation_player.play("OpenMarket")
	else:
		animation_player.play("CloseMarket")
	
	_is_open = !_is_open
