extends Control

@export var resource_worker_container : VBoxContainer

var _resource_worker : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	_resource_worker = preload("res://Scenes/ResourceWorkerUI.tscn")

	for resource in ResourceManager.Resources:
		var res_wor = _resource_worker.instantiate()
		resource_worker_container.add_child(res_wor)