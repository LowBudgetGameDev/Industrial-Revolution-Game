extends Control

@export var asset_worker_container : VBoxContainer

var _asset_worker : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	_asset_worker = preload("res://Scenes/AssetWorkerUI.tscn")

	for resource in AssetManager.Asset_Enum.keys():
		var ass_wor = _asset_worker.instantiate()
		ass_wor.work_asset = AssetManager.instance.get_asset_resource(resource)
		ass_wor.init()
		asset_worker_container.add_child(ass_wor)
