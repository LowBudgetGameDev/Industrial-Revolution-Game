extends Control

@export var open_button : TextureButton
@export var animation_player : AnimationPlayer
@export var market_asset_container : GridContainer
@export var market_worker_container : GridContainer

var _market_resource : PackedScene
var _market_worker : PackedScene
var _is_open := false

# Called when the node enters the scene tree for the first time.
func _ready():
	_market_resource = preload("res://Scenes/MarketResourceUI.tscn")
	_market_worker = preload("res://Scenes/MarketWorkerUI.tscn")

	open_button.pressed.connect(self._toggle_ui)

	for resource in AssetManager.Asset:
		var mar_res = _market_resource.instantiate()
		market_asset_container.add_child(mar_res)
	
	for i in range(3):
		var mar_wor = _market_worker.instantiate()
		market_worker_container.add_child(mar_wor)

func _toggle_ui():
	if !_is_open:
		animation_player.play("OpenMarket")
	else:
		animation_player.play("CloseMarket")
	
	_is_open = !_is_open
