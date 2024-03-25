extends Control

class_name HiredUI

@export var hired_worker_container : VBoxContainer

static var instance

var _hired_worker : PackedScene
var _selected_worker : Worker

func _init():
	instance = self

func _ready():
	_hired_worker = preload("res://Scenes/HiredWorkersUI.tscn")

	for human in WorkerManager.Worker_Enum.keys():
		var hir_wor = _hired_worker.instantiate()
		hir_wor.worker = WorkerManager.instance.get_worker_resource(human)
		hir_wor.on_selected.connect(self._set_selected_worker)
		hir_wor.hiredUI = self
		hir_wor.init()
		hired_worker_container.add_child(hir_wor)

func _set_selected_worker(hired_worker_ui : HiredWorkerUI):
	_selected_worker = hired_worker_ui.get_worker()

func deselect_worker():
	if WorkerManager.instance.get_amount_workers_hired(_selected_worker) > 0:
		return

	_selected_worker = null

func get_selected_worker() -> Worker:
	return _selected_worker
