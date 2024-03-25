extends Control

@export var hired_worker_container : VBoxContainer

var _hired_worker : PackedScene

func _ready():
    _hired_worker = preload("res://Scenes/HiredWorkersUI.tscn")

    for human in WorkerManager.Worker_Enum.keys():
        var hir_wor = _hired_worker.instantiate()
        hir_wor.worker = human
        hir_wor.init()
        hired_worker_container.add_child(hir_wor)
