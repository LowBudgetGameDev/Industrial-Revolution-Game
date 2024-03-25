extends Node

class_name WorkerManager

enum Worker_Enum {Child, Slave, Immigrant, Adult}

static var instance : WorkerManager

signal on_hired_worker

var _hired_workers_dictionary : Dictionary = {}
var _working_workers_dictionary : Dictionary = {}
var _worker_resource_dictionary : Dictionary = {}

func _init():
	instance = self

	for worker in Worker_Enum.keys():
		_hired_workers_dictionary[worker] = 0
		_working_workers_dictionary[worker] = 0

	for worker in Worker_Enum.keys():
		var resource = load("res://Resources/Workers/" + str(worker) + ".tres")
		_worker_resource_dictionary[worker] = resource

func buy_worker(worker: Worker):
	if (!MoneyManager.instance.can_spend_money(worker.buy_price)):
		return

	MoneyManager.instance.lose_money(worker.buy_price)
	var wor = _worker_resource_dictionary.find_key(worker)

	_hired_workers_dictionary[wor] += 1
	on_hired_worker.emit()

func put_to_work(worker: Worker):
	var wor = _worker_resource_dictionary.find_key(worker)

	_hired_workers_dictionary[wor] -= 1
	_working_workers_dictionary[wor] += 1

	on_hired_worker.emit()

func get_worker_resource(worker: String) -> Worker:
	return _worker_resource_dictionary[worker]

func get_amount_workers_hired(worker: Worker) -> int:
	var wor = _worker_resource_dictionary.find_key(worker)
	return _hired_workers_dictionary[wor]

func get_amount_working_workers(worker: Worker) -> int:
	var wor = _worker_resource_dictionary.find_key(worker)
	return _working_workers_dictionary[wor]
