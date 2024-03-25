extends Node

class_name WorkerManager

enum Worker_Enum {Child, Slave, Immigrant, Adult}

static var instance : WorkerManager

var _worker_resource_dictionary : Dictionary = {}

func _init():
	instance = self

	for worker in Worker_Enum.keys():
		var resource = load("res://Resources/Workers/" + str(worker) + ".tres")
		_worker_resource_dictionary[worker] = resource

func get_worker_resource(worker: String) -> Worker:
	return _worker_resource_dictionary[worker]
