extends Control

@export var asset_worker_container : VBoxContainer

var _asset_worker : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	_asset_worker = preload("res://Scenes/AssetWorkerUI.tscn")

	for asset in AssetManager.Asset_Enum:
		var ass_wor = _asset_worker.instantiate()
		asset_worker_container.add_child(ass_wor)
